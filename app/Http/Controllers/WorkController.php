<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\WorkDocumentations;
use App\Work;
use Validator;

class WorkController extends Controller
{
    private $res = [];
    private $request;

    function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['message'] = '';
        $this->res['data'] = [];
        $this->status_code = 204;

        date_default_timezone_set('America/Mexico_City');
    }//__construct()

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){}

    public function convert()
    {
        try {
            $new_work_status_id = $this->request->input('work_status_id');
            $employee_id = $this->request->input('employee_id');

            $employee = Work::find($employee_id);

            if($employee){
                $employee->work_status_id = $new_work_status_id;
                $employee->save();
            } else {
                $this->res['message'] = 'El Empleado no existe.';    
            }
            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//convertEmployee()

    public function workByStatus()
    {
        try{
            $work_status_id = $this->request->input('work_status_id');
            $work_list = [];

            $work_list = Work::with('Company', 'ContractType', 'PeriodType', 'ContributionBase', 'Department', 'EmployeeType', 'PaymentMethod', 'WorkShift', 'Sex', 'DiscountType')
                                ->where('work_status_id', $work_status_id)
                                ->jsonPaginate();

            if(count($work_list) > 0){
                foreach ($work_list as $kul => $vul) $vul->loader = false;
                $this->res['data'] = $work_list;
            } else {
                if($work_status_id == 1) $this->res['message'] = 'No hay Trabajadores en Proceso de Alta hasta el momento.';
                if($work_status_id == 2) $this->res['message'] = 'No hay Trabajadores en Proceso de Reingreso hasta el momento.';
                if($work_status_id == 3) $this->res['message'] = 'No hay Trabajadores Activos hasta el momento.';
                if($work_status_id == 4) $this->res['message'] = 'No hay Trabajadores en Proceso de Baja hasta el momento.';
                if($work_status_id == 5) $this->res['message'] = 'No hay Trabajadores Dado de Baja hasta el momento.';
            }
            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        try{
            $validator = Validator::make($this->request->all(), [
                'company_id'                => 'required',
                'code'                      => 'required|max:45',
                'discharge_date'            => 'required|max:45',
                'name'                      => 'required|max:100',
                'first_name'                => 'required|max:100',
                'last_name'                 => 'required|max:100',
                'contract_type_id'          => 'required',
                'period_type_id'            => 'required',
                'real_daily_salary'         => 'required',
                'imss_daily_salary'         => 'required',
                'contribution_base_salary'  => 'required',
                'contribution_base_id'      => 'required',
                'employee_type_id'          => 'required',
                'payment_method_id'         => 'required',
                'work_shift_id'             => 'required',
                'number_afore'              => 'required|max:100',
                'social_security_number'    => 'required|max:100',
                'rfc'                       => 'required|max:13',
                'curp'                      => 'required|max:22',
                'sex_id'                    => 'required',
                'birth_city'                => 'required|max:100',
                'birth_date'                => 'required',
            ]);

            if(!$validator->fails()) {
                $name = $this->request->input('name');
                $first_name = $this->request->input('first_name');
                $last_name = $this->request->input('last_name');

                $this->request->merge(['work_status_id' => 1] );

                $last_repeated = Work::where('name', $name)
                                        ->where('first_name', $first_name)
                                        ->where('last_name', $last_name)
                                        ->count();
                if($last_repeated == 0){
                    $work_trashed = Work::withTrashed()->where('name', $name)
                                            ->where('first_name', $first_name)
                                            ->where('last_name', $last_name)
                                            ->count();

                    if($work_trashed == 0){
                        $work = new Work;
                        $work->create($this->request->all());

                        $this->res['message'] = 'Trabajador creado correctamente.';
                        $this->status_code = 200;
                    } else {
                        Work::withTrashed()->where('name', $name)
                                        ->where('first_name', $first_name)
                                        ->where('last_name', $last_name)
                                        ->restore();

                        $work = Work::where('name', $name)
                                            ->where('first_name', $first_name)
                                            ->where('last_name', $last_name)
                                            ->first();

                        $work->updateOrCreate(['id' => $work->id], $this->request->all());

                        $this->res['message'] = 'Trabajador restaurado correctamente.';
                        $this->status_code = 200;
                    }
                } else {
                    $this->res['message'] = 'El trabajador ya existe.';
                    $this->status_code = 423;
                }
            } else {
                $this->res['message'] = 'Por favor llene todos los campos requeridos o revise la longitud de los campos.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }
        return response()->json($this->res, $this->status_code);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id)
    {
        try{
            if(is_numeric($id)){
                $validator = Validator::make($this->request->all(), [
                    'code'                      => 'required|max:45',
                    'discharge_date'            => 'required|max:45',
                    'name'                      => 'required|max:100',
                    'first_name'                => 'required|max:100',
                    'last_name'                 => 'required|max:100',
                    'contract_type_id'          => 'required',
                    'period_type_id'            => 'required',
                    'real_daily_salary'         => 'required',
                    'imss_daily_salary'         => 'required',
                    'contribution_base_salary'  => 'required',
                    'contribution_base_id'      => 'required',
                    'employee_type_id'          => 'required',
                    'payment_method_id'         => 'required',
                    'work_shift_id'             => 'required',
                    'number_afore'              => 'required|max:100',
                    'social_security_number'    => 'required|max:100',
                    'rfc'                       => 'required|max:13',
                    'curp'                      => 'required|max:22',
                    'sex_id'                    => 'required',
                    'birth_city'                => 'required|max:100',
                    'birth_date'                => 'required',
                ]);

                if(!$validator->fails()) {
                    $work_exist = Work::find($id);
                    if($work_exist){
                        Work::updateOrCreate(['id' => $id], $this->request->all());
                        $this->res['message'] = 'Trabajadpor actualizado correctamente.';
                        $this->status_code = 200;
                    } else {
                        $this->res['message'] = 'El Trabajador no existe.';
                        $this->status_code = 422;
                    }
                } else {
                    $this->res['message'] = 'Por favor llene todos los campos requeridos o revise la longitud de los campos.';
                    $this->status_code = 422;
                }
            } else {

                $this->res['message'] = 'ID incorrecto.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            if(is_numeric($id)){
                $work = Work::find($id);
                if($work){
                    $work->delete();
                    $work_doc = WorkDocumentations::where('work_id',$id)->first();
                    if($work_doc){
                        $work_doc->delete();
                    }
                    $this->res['message'] = 'Trabajador eliminado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El Trabajador no existe.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'ID incorrecto.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }
}
