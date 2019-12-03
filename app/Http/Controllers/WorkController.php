<?php

namespace App\Http\Controllers;

use App\ContractTypes;
use App\ContributionBases;
use App\Department;
use App\DiscountTypes;
use App\EmployeeTypes;
use Illuminate\Http\Request;

use App\WorkDocumentations;
use App\Work;
use Validator;
use App\Http\Controllers\SharedController as sharedController;
use App\Job;
use App\PaymentMethods;
use App\PeriodTypes;
use App\Sex;
use App\WorkShifts;

class WorkController extends Controller
{
    private $res = [];
    private $request;
    private $sharedController;

    function __construct(Request $request)
    {
        $this->sharedController = new SharedController($request);
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

            $work_list = Work::with('Company', 'ContractType', 'PeriodType', 'ContributionBase', 'Department', 'EmployeeType', 'PaymentMethod', 'WorkShift', 'Sex', 'DiscountType');

            if($work_status_id != null){
                $work_list = $work_list->where('work_status_id', $work_status_id);
            }

            $work_list = $work_list->jsonPaginate();

            if(count($work_list) > 0){
                foreach ($work_list as $kul => $vul){
                    $vul->loader = false;
                    if($vul->ine_file_url != null) $vul->ine_file_url = asset('employeeDocs/'.$vul->ine_file_url);
                    if($vul->curp_file_url != null) $vul->curp_file_url = asset('employeeDocs/'.$vul->curp_file_url);
                    if($vul->address_file_url != null) $vul->address_file_url = asset('employeeDocs/'.$vul->address_file_url);
                    if($vul->contract_file_url != null) $vul->contract_file_url = asset('employeeDocs/'.$vul->contract_file_url);
                }
                $this->res['data'] = $work_list;
            } else {
                if($work_status_id == null) $this->res['message'] = 'No hay Trabajadores hasta el momento.';
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
                'number_afore'              => 'max:100',
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
                        $work_id = $work->create($this->request->all())->id;

                        $this->res['employee_id'] = $work_id;
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

                        $work_id = $work->updateOrCreate(['id' => $work->id], $this->request->all())->id;

                        $this->res['employee_id'] = $work_id;
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

    public function uploadDoc()
    {
        try {
            $this->res['data'] = $_FILES;
            $this->res['request'] = $_REQUEST;
            $employee_id = $_REQUEST['employee_id'];
            //$employee_id = 6;

            if(isset($_REQUEST['ine_file_url_deleted'])){
                if($_REQUEST['ine_file_url_deleted'] == 'true'){
                    $work_file = Work::find($employee_id);
                    if($work_file){
                        unlink(asset('employeeDocs/'.$work_file->ine_file_url));
                        $work_file->ine_file_url = null;
                        $work_file->save();
                    }
                }
            }
            
            if(isset($_REQUEST['curp_file_url_deleted'])){
                if($_REQUEST['curp_file_url_deleted'] == 'true'){
                    $work_file = Work::find($employee_id);
                    if($work_file){
                        unlink(asset('employeeDocs/'.$work_file->curp_file_url));
                        $work_file->curp_file_url = null;
                        $work_file->save();
                    }
                }
            }

            if(isset($_REQUEST['address_file_url_deleted'])){
                if($_REQUEST['address_file_url_deleted'] == 'true'){
                    $work_file = Work::find($employee_id);
                    if($work_file){
                        unlink(asset('employeeDocs/'.$work_file->address_file_url));
                        $work_file->address_file_url = null;
                        $work_file->save();
                    }
                }
            }

            if(isset($_REQUEST['contract_file_url_deleted'])){
                if($_REQUEST['contract_file_url_deleted'] == 'true'){
                    $work_file = Work::find($employee_id);
                    if($work_file){
                        unlink(asset('employeeDocs/'.$work_file->contract_file_url));
                        $work_file->contract_file_url = null;
                        $work_file->save();
                    }
                }
            }

            if(isset($_REQUEST['imss_file_url_deleted'])){
                if($_REQUEST['imss_file_url_deleted'] == 'true'){
                    $work_file = Work::find($employee_id);
                    if($work_file){
                        unlink(asset('employeeDocs/'.$work_file->imss_file_url));
                        $work_file->imss_file_url = null;
                        $work_file->save();
                    }
                }
            }

            if(isset($_REQUEST['baja_imss_file_url_deleted'])){
                if($_REQUEST['baja_imss_file_url_deleted'] == 'true'){
                    $work_file = Work::find($employee_id);
                    if($work_file){
                        unlink(asset('employeeDocs/'.$work_file->baja_imss_file_url));
                        $work_file->baja_imss_file_url = null;
                        $work_file->save();
                    }
                }
            }

            if(isset($_REQUEST['finiquito_file_url_deleted'])){
                if($_REQUEST['finiquito_file_url_deleted'] == 'true'){
                    $work_file = Work::find($employee_id);
                    if($work_file){
                        unlink(asset('employeeDocs/'.$work_file->finiquito_file_url));
                        $work_file->finiquito_file_url = null;
                        $work_file->save();
                    }
                }
            }


            $work = Work::find($employee_id);
            if($work){
                if(isset($_FILES['ine_file'])){
                    if(isset($_FILES['ine_file']['name'])){
                        $file = $_FILES['ine_file']; 

                        $porciones = explode(".", $file['name']);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $file['name']);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($file['tmp_name'], 'employeeDocs/'.basename($final_image_name))){
                            $work->ine_file_url = $final_image_name;
                        }
                    }
                }

                if(isset($_FILES['address_files'])){
                    if(isset($_FILES['address_files']['name'])){
                        $file = $_FILES['address_files']; 

                        $porciones = explode(".", $file['name']);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $file['name']);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($file['tmp_name'], 'employeeDocs/'.basename($final_image_name))){
                            $work->address_file_url = $final_image_name;
                        }
                    }
                }

                if(isset($_FILES['curp_files'])){
                    if(isset($_FILES['curp_files']['name'])){
                        $file = $_FILES['curp_files']; 

                        $porciones = explode(".", $file['name']);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $file['name']);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($file['tmp_name'], 'employeeDocs/'.basename($final_image_name))){
                            $work->curp_file_url = $final_image_name;
                        }
                    }
                }

                if(isset($_FILES['contract_files'])){
                    if(isset($_FILES['contract_files']['name'])){
                        $file = $_FILES['contract_files']; 

                        $porciones = explode(".", $file['name']);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $file['name']);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($file['tmp_name'], 'employeeDocs/'.basename($final_image_name))){
                            $work->contract_file_url = $final_image_name;
                        }
                    }
                }

                if(isset($_FILES['imss_files'])){
                    if(isset($_FILES['imss_files']['name'])){
                        $file = $_FILES['imss_files']; 

                        $porciones = explode(".", $file['name']);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $file['name']);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($file['tmp_name'], 'employeeDocs/'.basename($final_image_name))){
                            $work->imss_file_url = $final_image_name;
                        }
                    }
                }

                if(isset($_FILES['baja_imss_files'])){
                    if(isset($_FILES['baja_imss_files']['name'])){
                        $file = $_FILES['baja_imss_files']; 

                        $porciones = explode(".", $file['name']);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $file['name']);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($file['tmp_name'], 'employeeDocs/'.basename($final_image_name))){
                            $work->baja_imss_file_url = $final_image_name;
                        }
                    }
                }

                if(isset($_FILES['finiquito_files'])){
                    if(isset($_FILES['finiquito_files']['name'])){
                        $file = $_FILES['finiquito_files']; 

                        $porciones = explode(".", $file['name']);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $file['name']);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($file['tmp_name'], 'employeeDocs/'.basename($final_image_name))){
                            $work->finiquito_file_url = $final_image_name;
                        }
                    }
                }

                $work->save();
            }

            $this->res['message'] = 'Empleado creado correctamente.';
            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
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

    public function loadWorkData()
    {
        try {
            $work_id = $this->request->input('employee_id');
            $work_data = null;
            $user = $this->request->user();

            $companies_catalog = [];
            $contract_type_catalog = [];
            $period_type_catalog = [];
            $contribution_base_catalog = [];
            $department_catalog = [];
            $job_catalog = [];
            $employee_type_catalog = [];
            $payment_method_catalog = [];
            $work_shift_catalog = [];
            $sex_catalog = [];
            $discount_type_catalog = [];

            $work_data = Work::find($work_id);

            if($work_data->ine_file_url != null){
                $work_data->ine_file_url = asset('employeeDocs/'.$work_data->ine_file_url);
            }
            $work_data->ine_file_url_deleted = false;

            if($work_data->address_file_url != null){
                $work_data->address_file_url = asset('employeeDocs/'.$work_data->address_file_url);
            }
            $work_data->address_file_url_deleted = false;

            if($work_data->curp_file_url != null){
                $work_data->curp_file_url = asset('employeeDocs/'.$work_data->curp_file_url);
            }
            $work_data->curp_file_url_deleted = false;

            if($work_data->contract_file_url != null){
                $work_data->contract_file_url = asset('employeeDocs/'.$work_data->contract_file_url);
            }
            $work_data->contract_file_url_deleted = false;

            if($work_data->imss_file_url != null){
                $work_data->imss_file_url = asset('employeeDocs/'.$work_data->imss_file_url);
            }
            $work_data->imss_file_url_deleted = false;

            if($work_data->baja_imss_file_url != null){
                $work_data->baja_imss_file_url = asset('employeeDocs/'.$work_data->baja_imss_file_url);
                
            }
            $work_data->baja_imss_file_url_deleted = false;

            if($work_data->finiquito_file_url != null){
                $work_data->finiquito_file_url = asset('employeeDocs/'.$work_data->finiquito_file_url);
                
            }
            $work_data->finiquito_file_url_deleted = false;

            $companies_catalog          = $this->sharedController->getCompanyCatalog($user);
            $contract_type_catalog      = ContractTypes::where('company_id', $work_data->company_id)->get();
            $period_type_catalog        = PeriodTypes::where('company_id', $work_data->company_id)->get();
            $contribution_base_catalog  = ContributionBases::where('company_id', $work_data->company_id)->get();
            $department_catalog         = Department::where('company_id', $work_data->company_id)->get();
            $job_catalog                = Job::where('company_id', $work_data->company_id)->where('department_id', $work_data->department_id)->get();
            $employee_type_catalog      = EmployeeTypes::where('company_id', $work_data->company_id)->get();
            $payment_method_catalog     = PaymentMethods::where('company_id', $work_data->company_id)->get();
            $work_shift_catalog         = WorkShifts::where('company_id', $work_data->company_id)->get();
            $sex_catalog                = Sex::all();
            $discount_type_catalog      = DiscountTypes::where('company_id', $work_data->company_id)->get();

            $this->res = [
                'data'      => $work_data,
                'catalogs'  => [
                    'companies_catalog'     => $companies_catalog['companies'],
                    'contract_type_catalog' => $contract_type_catalog,
                    'period_type_catalog'   => $period_type_catalog,
                    'contribution_base_catalog' => $contribution_base_catalog,
                    'department_catalog'    => $department_catalog,
                    'job_catalog'           => $job_catalog,
                    'employee_type_catalog' => $employee_type_catalog,
                    'payment_method_catalog'    => $payment_method_catalog,
                    'work_shift_catalog'    => $work_shift_catalog,
                    'sex_catalog'           => $sex_catalog,
                    'discount_type_catalog' => $discount_type_catalog
                ]
                
            ];
            $this->status_code = 200;
        } catch(\Excpetion $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//LoadWorkData(){


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
                    $work_exist = Work::find($id);
                    if($work_exist){
                        $work_id = Work::updateOrCreate(['id' => $id], $this->request->all())->id;
                        
                        $this->res['employee_id'] = $work_id;
                        $this->res['message'] = 'Trabajador actualizado correctamente.';
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
