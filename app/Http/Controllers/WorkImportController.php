<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

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
            $this->res['data'] = $_FILES;
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
