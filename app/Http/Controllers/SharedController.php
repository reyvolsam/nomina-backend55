<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\User;
use App\Company;
use App\CompanyUser;
use App\Department;

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
                $res['status'] = true;
            }

            //ADMINISTRATOR
            if($user->group_id == 1){
                $user = User::find($this->request->user()->id);
                $companies = $user->CompanyUser()->get();
                //$companies = User::whereHas('Company')->where('id', $user->id)->get();
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

            //ROOT O ADMINISTRADOR
            if($this->request->user()->group_id == 4 || $this->request->user()->group_id == 1){
                $add = [
                    "name" => 'Usuarios',
                    "icon" => 'how_to_reg',
                    "active" => false,
                    "url" => '/user',
                    "submenu" => []
                ];

                array_push($menu, $add);

                $add =  [
                    "name" => 'Catalogos',
                    "url" => null,
                    "icon" => 'list',
                    "active" => false,
                    "submenu" => [
                        [
                            "name"  => 'Empresas',
                            "url"   => '/catalog/company',
                            "icon"  => 'list'
                        ],
                        [
                            "name"  => 'Departamentos',
                            "url"   => '/catalog/departments',
                            "icon"  => 'list'
                        ],
                        [
                            "name"  => 'Puestos',
                            "url"   => '/catalog/jobs',
                            "icon"  => 'list'
                        ],
                        [
                            "name"  => 'Tipos de Contrato',
                            "url"   => '/catalog/contractTypes',
                            "icon"  => 'list'
                        ],
                        [
                            "name"  => "Base de Cotizacón",
                            "url"   => "/catalog/contributionBases", 
                            "icon"  => "list"
                        ],
                        
                        [
                            "name"  => "Tipos de Empleado",
                            "url"   => "/catalog/employeeTypes", 
                            "icon"  => "list"
                        ],
                        [
                            "name"  => "Turno de Trabajo",
                            "url"   => "/catalog/workShifts", 
                            "icon"  => "list"
                        ],
                        [
                            "name"  => "Metodo de Pago",
                            "url"   => "/catalog/paymentMethods", 
                            "icon"  => "list"
                        ],
                        [
                            "name"  => "Tipos de Descuento",
                            "url"   => "/catalog/discountTypes", 
                            "icon"  => "list"
                        ],
                        [
                            "name"  => "Tipos de Periodo",
                            "url"   => "/catalog/periodTypes", 
                            "icon"  => "list"
                        ]
                    ]
                ];

            }

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
