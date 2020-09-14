<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Company;
use App\CompanyUser;
use App\User;
use Illuminate\Database\Query\Builder;

class UserController extends Controller
{
    private $res = [];
    private $request;
    private static $generic_password = "Nomina2019";

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
    public function index()
    {
        try{
            $user_list = [];

            $user_list = User::with('Group', 'assigned_companies')->select('id', 'name', 'email', 'group_id', 'default_company_id', 'active');

            //ROOT 
            if($this->request->user()->group_id == 4){}

            //ADMINISTRADOR
            if($this->request->user()->group_id == 1){
                $user_list = $user_list->where('group_id', '!=', 4);
            }
            //PATRON
            if($this->request->user()->group_id == 2){
                $user_list = $user_list->where('group_id', 2);
            }

            //EJECUTIVO
            if($this->request->user()->group_id == 3){
                $user_list = $user_list->where('group_id', 3);
            }

            $user_list = $user_list->jsonPaginate();

            if(count($user_list) > 0){

                foreach ($user_list as $kul => $vul) $vul->loader = false;

                $this->res['data'] = $user_list;
            } else {
                $this->res['message'] = 'No hay usuarios hasta el momento.';
            }

            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }

    public function searchCompanies()
    {
        try{
            $company = $this->request->input('company');
            $companies_list = [];
            
            //ROOT
            if($this->request->user()->group_id == 4){
                $companies_list = Company::where('name', 'LIKE', '%'.$company.'%')->get();
            }
            //ADMINISTRATOR
            if($this->request->user()->group_id == 1){
                $user = User::find($this->request->user()->id);
                $companies_list = $user->CompanyUser()->where('name', 'LIKE', '%'.$company.'%')->get();
            }

            //PATRON
            if($this->request->user()->group_id == 2 || $this->request->user()->group_id == 3){
                $user = User::find($this->request->user()->id);
                $companies_list = $user->CompanyUser()->get();
            }

            if(count($companies_list) > 0){
                $this->res['data'] = $companies_list;
            } else {
                $this->status_code = 201;
                $this->res['message'] = 'No hay empresas con el criterio de busqueda indicado.';
            }
            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//searchCompanies
    
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
                'name'              => 'required|max:255',
                'email'             => 'required|max:255|email',
                'group_id'          => 'required'
            ]);

            $id                     = $this->request->input('id');
            $data['name']           = $this->request->input('name');
            $data['email']          = $this->request->input('email');
            $data['group_id']       = $this->request->input('group_id');
            $data['default_company_id'] = $this->request->input('default_company_id');
            $data['active']         = $this->request->input('active');
            $data['assigned_companies'] = $this->request->input('assigned_companies');
            $ban_create_user = false;

            if(!$validator->fails()) {
                
                if($data['group_id'] == 4){
                    $ban_create_user = true;
                } else {
                    if(count($data['assigned_companies']) > 0) $ban_create_user = true;
                }

                if($ban_create_user){
                    $user = User::where('email', '=', $data['email'])->get();

                    if(count($user) == 0){
                        $user = User::withTrashed()
                                        ->where('email', '=',$data['email'])
                                        ->get();
                        if( count($user) > 0 ){
                            User::withTrashed()->where('email', '=', $data['email'])->restore();

                            $user = User::where('email', '=', $data['email'])->first();

                            $user->password         = bcrypt(self::$generic_password);

                            $user->avatar               = 'avatar.png';
                            $user->group_id             = $data['group_id'];
                            $user->default_company_id   = $data['default_company_id'];
                            $user->active               = $data['active'];
                            $user->save();

                            //SI EL USUARIO A CREAR ES ROOT NO SE COMPANY USER
                            if($data['group_id'] != 4){
                                $CompanyUser_exist = CompanyUser::withTrashed()
                                                            //->where('company_id', '=', $data['company_id'])
                                                            ->where('user_id', '=', $user->id)
                                                            ->get();
                                if(count($CompanyUser_exist) > 0){
                                    foreach ($CompanyUser_exist as $kcu => $vcu) {
                                        $company_force_delete = CompanyUser::withTrashed()->where('id', $vcu->id)->first();
                                        $company_force_delete->forceDelete();
                                        
                                    }
                                }

                                if(count($data['assigned_companies']) > 0){
                                    foreach ($data['assigned_companies'] as $kac => $vav) {
                                        $CompanyUser = new CompanyUser();
                                        $CompanyUser->user_id = $user->id;
                                        $CompanyUser->company_id = $vav['id'];
                                        $CompanyUser->save();   
                                    }
                                }
                            }

                            $this->res['message'] = 'Usuario restaurado correctamente.';
                            $this->status_code = 200;
                        } else {
                            $user = new User;
                            $user->name                 = $data['name'];
                            $user->email                = $data['email'];
                            $user->password             = bcrypt(self::$generic_password);
                            $user->avatar               = 'avatar.png';
                            $user->group_id             = $data['group_id'];
                            $user->default_company_id   = $data['default_company_id'];
                            $user->active               = $data['active'];
                            $user->save();

                            //SI EL USUARIO A CREAR ES ROOT NO SE COMPANY USER
                            if($data['group_id'] != 4){
                                if(count($data['assigned_companies']) > 0){
                                    foreach ($data['assigned_companies'] as $kac => $vav) {
                                        $CompanyUser = new CompanyUser();
                                        $CompanyUser->user_id = $user->id;
                                        $CompanyUser->company_id = $vav['id'];
                                        $CompanyUser->save();   
                                    }
                                }
                            }

                            $this->res['message'] = 'Usuario creado correctamente.';
                            $this->status_code = 200;
                        }
                    } else {
                        $this->res['message'] = 'El correo electrónico ya existe.';
                        $this->status_code = 423;
                    }
                } else {
                    $this->res['message'] = 'Por favor, asigne una empresa al usuario.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'Por favor, llene todos los campos requeridos.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//store

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
                    'name'              => 'required|max:255',
                    'email'             => 'required|max:255|email',
                    'group_id'          => 'required'
                ]);

                $data['name']           = $this->request->input('name');
                $data['email']          = $this->request->input('email');
                $data['group_id']       = $this->request->input('group_id');
                $data['default_company_id'] = $this->request->input('default_company_id');
                $data['active']         = $this->request->input('active');
                $data['assigned_companies'] = $this->request->input('assigned_companies');

                if(!$validator->fails()) {
                    $user_exist = User::where('email', '=', $data['email'])->where('id', '!=', $id)->count();

                    if($user_exist == 0){
                        $user = User::find($id);
                        if($user){
                            $user->name                 = $data['name'];
                            $user->email                = $data['email'];
                            $user->group_id             = $data['group_id'];
                            $user->default_company_id   = $data['default_company_id'];
                            $user->active               = $data['active'];
                            $user->save();

                            //SI EL USUARIO A CREAR ES ROOT NO SE COMPANY USER
                            if($data['group_id'] != 4){
                                $CompanyUser_exist = CompanyUser::withTrashed()
                                                            //->where('company_id', '=', $data['company_id'])
                                                            ->where('user_id', '=', $user->id)
                                                            ->get();
                                if(count($CompanyUser_exist) > 0){
                                    foreach ($CompanyUser_exist as $kce => $vce) {
                                        $vce->forceDelete();
                                    }
                                }

                                if(count($data['assigned_companies']) > 0){
                                    foreach ($data['assigned_companies'] as $kac => $vav) {
                                        $CompanyUser = new CompanyUser();
                                        $CompanyUser->user_id = $user->id;
                                        $CompanyUser->company_id = $vav['id'];
                                        $CompanyUser->save();   
                                    }
                                }
                            }

                            $this->res['message'] = 'Usuario actualizado correctamente.';
                            $this->status_code = 201;
                        } else {
                            $this->res['message'] = 'El usuario no existe.';
                            $this->status_code = 422;
                        }
                    } else {
                        $this->res['message'] = 'El correo electrónico ya existe.';
                        $this->status_code = 423;
                    }
                } else {
                    $this->res['message'] = 'Por favor llene todos los campos requeridos.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'ID incorrecto.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
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
                $user = User::find($id);
                if($user){
                    $company_user = CompanyUser::where('user_id', $id)->first();
                    $company_user->delete();
                    $user->delete();
                    $this->res['message'] = 'Usuario eliminado correctamente.';
                    $this->status_code = 201;
                } else {
                    $this->res['message'] = 'El usuario no existe.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'ID incorrecto.';
                $this->status_code = 422;
            }
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }
}
