<?php

namespace App\Http\Controllers;

use App\ContractTypes;
use App\ContributionBases;
use Illuminate\Http\Request;
use App\Imports\WorkImport;
use App\PeriodTypes;
use Maatwebsite\Excel\Facades\Excel;
use App\Work;
use App\WorkStates;

class WorkImportController extends Controller
{
    private $res = [];
    private $request;

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['message'] = '';
        $this->res['data'] = [];
        $this->status_code = 204;

        date_default_timezone_set('America/Mexico_City');
    }

    public function import()
    {
        try {
            $this->res['data'] = $_FILES['employee_file'];
            $file = '';
            $file = $_FILES['employee_file']['tmp_name'];

            $company_id = $this->request->input('company_id');

            if(file_exists($file) ){    
                $EmployeeImport = [];
                $EmployeeImport = Excel::toArray(new WorkImport, $_FILES['employee_file']['tmp_name'], null,  \Maatwebsite\Excel\Excel::XLSX);

                if(count($EmployeeImport[0]) > 0){
                    foreach ($EmployeeImport[0] as $k => $v) {
                        if($k > 0){
                            $WorkDemo = new Work();
                            $WorkDemo->company_id = $company_id;
                            $WorkDemo->code = $v[0];
                            $WorkDemo->discharge_date = date('Y-m-d', strtotime($v[1]));
                            $WorkDemo->termination_date = date('Y-m-d', strtotime($v[2]));
                            $WorkDemo->reentry_date = date('Y-m-d', strtotime($v[3]));

                            $contract_type = ContractTypes::where('name', $v[4])
                                                    ->where('company_id', $company_id)
                                                    ->first();
                            $WorkDemo->contract_type_id = ($contract_type != null) ? $contract_type->id : null;

                            $WorkDemo->first_name = $v[5];
                            $WorkDemo->last_name = $v[6];
                            $WorkDemo->name = $v[7];

                            $period_type = PeriodTypes::where('name', $v[8])
                                                    ->where('company_id', $company_id)
                                                    ->first();
                            $WorkDemo->period_type_id = ($period_type != null) ? $period_type->id : null;

                            $WorkDemo->contribution_base_salary = $v[9];

                            $contribution_bases = ContributionBases::where('name', $v[11])
                                                    ->where('company_id', $company_id)
                                                    ->first();
                            $WorkDemo->contribution_base_id = ($contribution_bases != null) ? $contribution_bases->id : null;

                            $work_states = WorkStates::where('name', $v[12])
                                                            ->first();
                            $WorkDemo->work_status_id = ($work_states != null) ? $work_states->id : null;
                            
                            //ME QUEDE EN DEPARTAMNTO

                            $WorkDemo->save();
                        }
                    }
                }

                $this->res['data2'] = $EmployeeImport[0];


            } else {
                $this->res['message'] = 'El archivo no existe.';
            }
            /*if($this->request->hasFile('employee_file')){
                $this->res['message'] = 'OKOK';
            } else {
                $this->res['message'] = 'MAL';
            }*/
            $this->status_code = 200;
        } catch (\Exception $e) {
            $this->status_code = 500;
            $this->res['message'] = 'Error en el sistema.'.$e;
        }

        return response()->json($this->res, $this->status_code);
    }//import()

}
