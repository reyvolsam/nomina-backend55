<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Nomina;
use App\NominaDispersion;
use App\NominaExcel;

class NominaController extends Controller
{
    private $res = [];
    private $request;

    function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['message'] = '';
        $this->res['data'] = [];
        $this->status_code = 204;
    }//__construct()

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        try {
            $this->res['data'] = $_FILES;
            $this->res['input'] = $_REQUEST;

            if(count($_FILES) > 0 ){

                $nomina = new Nomina();
                $nomina->date   = $_REQUEST['nomina_date'];
                $nomina->period = $_REQUEST['nomina_period'];
                $nomina->obra   = $_REQUEST['obra'];
                $nomina->save();

                if(count($_FILES['excel_files']['name'])){
                    foreach ($_FILES['excel_files']['name'] as $kef => $vef) {
                        $porciones = explode(".", $vef);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vef);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['excel_files']['tmp_name'][$kef], 'nomina_excel/'.basename($final_image_name))){
                            $nomina_excel = new NominaExcel();
                            $nomina_excel->nomina_id = $nomina->id;
                            $nomina_excel->file_url = $final_image_name;
                            $nomina_excel->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }

                if(count($_FILES['dispersion_files']['name'])){
                    foreach ($_FILES['dispersion_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['dispersion_files']['tmp_name'][$kdf], 'dispersion_files/'.basename($final_image_name))){
                            $nomina_dispersion = new NominaDispersion();
                            $nomina_dispersion->nomina_id = $nomina->id;
                            $nomina_dispersion->file_url = $final_image_name;
                            $nomina_dispersion->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
                $this->status_code = 200;
            }
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

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
