<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\User;
use App\Company;
use App\CompanyUser;
use App\Department;
use App\ContractTypes;
use App\PeriodTypes;
use App\ContributionBases;
use App\Job;
use App\EmployeeTypes;
use App\PaymentMethods;
use App\WorkShifts;
use App\DiscountTypes;

class SharedController extends Controller
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

    public function getCompanyCatalogFromUser(){

        $this->res = $this->getCompanyCatalogFromUserMethod();
        $this->status_code = $this->res['status_code'];
        return response()->json($this->res, $this->status_code);
    }//

    public function getCompanyCatalogFromUserMethod(){
        $res = [];
        $res['status'] = false;
        $res['status_code'] = 204;
        $res['message'] = '';
        $res['data'] = [];

        try{
            $user = $this->request->user();

            $resCatalog = $this->getCompanyCatalog($user);
            if($resCatalog['status']){
                $res['data'] = $resCatalog['companies'];
                $res['message'] = $resCatalog['message'];
                $res['status'] = true;
                $res['status_code'] = 200;
            } else {
                $res['message'] = $resCatalog['message'];
                $res['status_code'] = 201;
            }

        } catch(\Exception $e) {
            $res['message'] = 'Error en el sistema.'.$e;
            $res['status_code'] = 500;
        }
        return $res;
    }

    public function getCompanyCatalog($user){
        $res = [];
        $res['status'] = false;
        $res['companies'] = [];
        $res['message'] = '';

        try {
            $companies = [];

            //ROOT
            if($user->group_id == 4){
                $companies = Company::all();

                if(count($companies) == 0) $res['message'] = 'No hay empresa hasta el momento.';
                $res['status'] = true;
            } else {
                $user = User::find($this->request->user()->id);
                $companies = $user->CompanyUser()->get();
                if(count($companies) > 0){
                    $res['status'] = true;
                    $this->res['datas'] = $companies;
                } else {
                    $res['message'] = 'El usuario no tiene asignado ninguna empresa.';
                }
            }

            foreach ($companies as $kul => $vul) $vul->default_company = false;
            
            $res['companies'] = $companies;

        } catch(\Exception $e) {
            $res['message'] = 'Error en el sistema.'.$e;
        }

        return $res;
    }

    public function getCatalogsFromCompany()
    {
        try {
            $company_id = $this->request->input('company_id');
            $data = [];
            $contract_types_list = [];
            $this->res['com'] = $company_id;
            if($company_id != null){
                $contract_types_list = ContractTypes::where('company_id', $company_id)->get();
                $data['contract_types_list'] = $contract_types_list;

                $period_types_list = PeriodTypes::where('company_id', $company_id)->get();
                $data['period_types_list'] = $period_types_list;

                $conribution_bases_list = ContributionBases::where('company_id', $company_id)->get();
                $data['conribution_bases_list'] = $conribution_bases_list;

                $departments_list = Department::where('company_id', $company_id)->get();
                $data['departments_list'] = $departments_list;

                $employee_types_list = EmployeeTypes::where('company_id', $company_id)->get();
                $data['employee_types_list'] = $employee_types_list;

                $payment_methods_list = PaymentMethods::where('company_id', $company_id)->get();
                $data['payment_methods_list'] = $payment_methods_list;

                $work_shifts_list = WorkShifts::where('company_id', $company_id)->get();
                $data['work_shifts_list'] = $work_shifts_list;
                
                $discount_types_list = DiscountTypes::where('company_id', $company_id)->get();
                $data['discount_types_list'] = $discount_types_list;
            }

            $this->res['data'] = $data;
            $this->status_code = 200;
        } catch (\Exception $e){
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//getCatalogsFromCompany()

    public function getJobsFromDepartment()
    {
        try{
            $company_id = $this->request->input('company_id');
            $department_id = $this->request->input('department_id');
            $jobs_list = [];

            $jobs_list = Job::where('company_id', $company_id)->where('department_id', $department_id)->get();

            $this->res['data'] = $jobs_list;
            $this->status_code = 200;
        } catch (\Exception $e){
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }

    public function getCompanyCatalogFromUserDepartments()
    {
        try{
            $user = $this->request->user();

            $companies_list = [];
            $departments_list = [];

            $resCompany = $this->getCompanyCatalogFromUserMethod();

            if($resCompany['status']){
                $companies_list = $resCompany['data'];
                $this->status_code = $resCompany['status_code'];
            } else {
                $this->res['message'] = $resCompany['message'];
                $this->status_code = $this->res['status_code'];
            }

            $departments_list = Department::where('company_id', $user->default_company_id)->get();

            $this->res['status'] = true;
            $this->res['data']['companies_list'] = $companies_list;
            $this->res['data']['departments_list'] = $departments_list;
        } catch (\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 500;
        }

        return response()->json($this->res, $this->status_code);
    }//

    public function BuildSystemMenu()
    {
        try{

            $menu = [];

            //MENU GENERAL
            $add = [
                "name"      => "Escritorio",
                "active"    => false,
                "icon"      => "apps",
                "url"       => "/",
                "submenu"   => []
            ];

            array_push($menu, $add);

            $add = [
                "name" => 'Usuarios',
                "icon" => 'how_to_reg',
                "active" => false,
                "url" => '/user',
                "submenu" => []
            ];
            array_push($menu, $add);

            if($this->request->user()->group_id != 3){
                $add =  [
                    "name" => 'Catalogos',
                    "url" => null,
                    "icon" => 'list',
                    "active" => false,
                    "submenu" => []
                ];

                array_push($menu, $add);

                if($this->request->user()->group_id == 1 || $this->request->user()->group_id == 4){
                    $add = [
                        "name"  => 'Empresas',
                        "url"   => '/catalog/company',
                        "icon"  => 'list'
                    ];
                    array_push($menu[2]['submenu'], $add);
                }

                $item = [
                            "name"  => 'Departamentos',
                            "url"   => '/catalog/departments',
                            "icon"  => 'list'
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => 'Puestos',
                            "url"   => '/catalog/jobs',
                            "icon"  => 'list'
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => 'Tipos de Contrato',
                            "url"   => '/catalog/contractTypes',
                            "icon"  => 'list'
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => "Base de Cotización",
                            "url"   => "/catalog/contributionBases", 
                            "icon"  => "list"
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => "Tipos de Empleado",
                            "url"   => "/catalog/employeeTypes", 
                            "icon"  => "list"
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => "Turno de Trabajo",
                            "url"   => "/catalog/workShifts", 
                            "icon"  => "list"
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => "Metodo de Pago",
                            "url"   => "/catalog/paymentMethods", 
                            "icon"  => "list"
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => "Tipos de Descuento",
                            "url"   => "/catalog/discountTypes", 
                            "icon"  => "list"
                ];
                array_push($menu[2]['submenu'], $item);
                $item = [
                            "name"  => "Tipos de Periodo",
                            "url"   => "/catalog/periodTypes", 
                            "icon"  => "list"
                ];
                array_push($menu[2]['submenu'], $item);
            }


            $add = [
                "name"      => "Empleados",
                "url"       => null,
                "icon"      => "contacts",
                "active"    => false,
                "submenu"   => [
                    [
                        "name"  => "Crear",
                        "url"   => "/employee/create",
                        "icon"  => "list"
                    ],
                    [
                        "name"  => "Todos los empleados",
                        "url"   => "/employee/all",
                        "icon"  => "list"
                    ],
                    [
                        "name"  => "En Proceso de Alta",
                        "url"   => "/employee/procesoAlta",
                        "icon"  => "list"
                    ],
                    [
                        "name"  => "Activos",
                        "url"   => "/employee/procesoActivo",
                        "icon"  => "list"
                    ],
                    [
                        "name"  => "En Proceso de Reingreso",
                        "url"   => "/employee/procesoReingreso",
                        "icon"  => "list"
                    ],
                    [
                        "name"  => "En Proceso de Baja",
                        "url"   => "/employee/procesoBaja",
                        "icon"  => "list"
                    ],
                    [
                        "name"  => "Dado de Baja",
                        "url"   => "/employee/baja",
                        "icon"  => "list"
                    ],
                    [
                        "name"  => "Importar",
                        "url"   => "/employee/import",
                        "icon"  => "list"
                    ]
                ]
            ];

            array_push($menu, $add);

            $add = [
                "name" => 'Archivos de Pago de Nomina',
                "icon" => 'how_to_reg',
                "active" => false,
                "url" => '/nomina',
                "submenu" => []
            ];

            array_push($menu, $add);

            $add = [
                "name" => 'Recibos Pago de Nomina',
                "icon" => 'money',
                "active" => false,
                "url" => '/payment_receipt',
                "submenu" => []
            ];

            array_push($menu, $add);

            $add = [
                "name" => 'Recibos IMSS',
                "icon" => 'assignment_ind',
                "active" => false,
                "url" => '/imss',
                "submenu" => []
            ];

            array_push($menu, $add);

            $this->res['data'] = $menu;
            
            if(count($menu) == 0) $this->res['message'] = "No se pudo identificar al usuario.";

            $this->status_code = 200;
        } catch (\Exception $e) {
            $this->res['message'] = 'Error en el sistema.'.$e;
            $this->status_code = 500;
        }

        return response()->json($this->res, $this->status_code);
    }//BuildSystemMenu()


}////
