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
use App\Department;
use App\PaymentMethods;
use App\WorkShifts;
use App\Sex;
use App\Job;
use App\Unionized;

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

                            $exist_worker = Work::where('name', $v[7])
                                                    ->where('first_name', $v[5])
                                                    ->where('last_name', $v[6])
                                                    ->where('email', $v[67])
                                                    ->where('company_id', $company_id)
                                                    ->where('rfc', $v[25])
                                                    ->count();
                            if($exist_worker == 0){
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

                                $WorkDemo->imss_daily_salary = $v[9];

                                $contribution_bases = ContributionBases::where('name', $v[11])
                                                        ->where('company_id', $company_id)
                                                        ->first();
                                $WorkDemo->contribution_base_id = ($contribution_bases != null) ? $contribution_bases->id : null;

                                $work_states = WorkStates::where('name', $v[12])
                                                                ->first();
                                $WorkDemo->work_status_id = ($work_states != null) ? $work_states->id : null;
                                
                                $departments = Department::where('name', $v[13])
                                                                ->where('company_id', $company_id)
                                                                ->first();
                                $WorkDemo->department_id = ($departments != null) ? $departments->id : null;

                                $unionized = Unionized::where('name', $v[14])
                                                            ->first();
                                $WorkDemo->unionized_id = ($unionized != null) ? $unionized->id : null;

                                $payment_method = PaymentMethods::where('name', $v[16])
                                                            ->where('company_id', $company_id)
                                                            ->first();
                                $WorkDemo->payment_method_id = ($payment_method != null) ? $payment_method->id : null;

                                $work_shift = WorkShifts::where('name', $v[17])
                                                            ->where('company_id', $company_id)
                                                            ->first();
                                $WorkDemo->work_shift_id = ($work_shift != null) ? $work_shift->id : null;

                                $WorkDemo->number_afore = $v[22];
                                $WorkDemo->social_security_number = $v[24];
                                $WorkDemo->rfc = $v[25];
                                $WorkDemo->curp = $v[26];

                                $sex = Sex::where('name', $v[27])->first();
                                $WorkDemo->sex_id = ($sex != null) ? $sex->id : null;

                                $WorkDemo->birth_city = $v[28];
                                $WorkDemo->birth_date = date('Y-m-d', strtotime($v[29]));
                                $WorkDemo->umf = $v[30];
                                $WorkDemo->fathers_name = $v[31];
                                $WorkDemo->mothers_name = $v[32];
                                $WorkDemo->current_address = $v[33];

                                $job = Job::where('name', $v[34])
                                                ->where('company_id', $company_id)
                                                ->first();
                                $WorkDemo->job_id = ($job != null) ? $job->id : null;

                                $WorkDemo->current_population = $v[35];
                                $WorkDemo->current_state = $v[36];
                                $WorkDemo->cp = $v[37];
                                $WorkDemo->telephone = $v[39];
                                $WorkDemo->fonacot_number = $v[66];
                                $WorkDemo->email = $v[67];
                                $WorkDemo->key_account = $v[69];

                                $WorkDemo->save();
                            }
                        }
                    }
                }
                $this->res['message'] = 'Empleados importados correctamente.';
            } else {
                $this->res['message'] = 'El archivo no existe.';
            }
            $this->status_code = 200;
        } catch (\Exception $e) {
            $this->status_code = 500;
            $this->res['message'] = 'Error en el sistema.'.$e;
        }

        return response()->json($this->res, $this->status_code);
    }//import()

}
