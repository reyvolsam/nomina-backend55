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
        try {
            $list = [];
            $list = Nomina::with('nomina_excel', 'nomina_dispersion')->get();
            if(count($list) > 0){
                $this->res['data'] = $list;

                foreach ($list as $kl => $vl) {
                    if(count($vl->nomina_excel) > 0){
                        foreach ($vl->nomina_excel as $ne => $vne){
                            $vne->file_url = asset('nomina_excel/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                    if(count($vl->nomina_dispersion) > 0){
                        foreach ($vl->nomina_dispersion as $ne => $vne){
                            $vne->file_url = asset('dispersion_files/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                }

            } else {
                $this->res['message'] = 'No hay registros de Nomina hasta el momento.';
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
        try {
            $this->res['data'] = $_FILES;
            $this->res['input'] = $_REQUEST;

            $id   = $_REQUEST['id'];

            if($id == 'null'){
                $nomina = new Nomina();
                $nomina->date   = $_REQUEST['date'];
                $nomina->period = $_REQUEST['period'];
                $nomina->obra   = $_REQUEST['obra'];
                $nomina->save();

                $this->uploadNominaFiles($nomina->id);
            } else {
                $nomina = Nomina::find($id);
                if($nomina){
                    $nomina->date   = $_REQUEST['date'];
                    $nomina->period = $_REQUEST['period'];
                    $nomina->obra   = $_REQUEST['obra'];
                    $nomina->save();
                    
                    $this->uploadNominaFiles($nomina->id);
                    
                    if(isset($_REQUEST['excel_edit'])){
                        $excel_edit = $_REQUEST['excel_edit'];
                        if(count($excel_edit) > 0){
                            foreach ($excel_edit as $kee => $vee) {
                                if($vee['deleted'] == 'true'){
                                    $deleteN = NominaExcel::find($vee['id']);
                                    if($deleteN) $deleteN->delete();
                                }
                            }
                        }
                    }

                    if(isset($_REQUEST['dispersion_edit'])){
                        $dispersion_edit = $_REQUEST['dispersion_edit'];
                        if(count($dispersion_edit) > 0){
                            foreach ($dispersion_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteD = NominaDispersion::find($vde['id']);
                                    if($deleteD) $deleteD->delete();
                                }
                            }
                        }
                    }
                } else {
                    $this->res['message'] = 'Este registro de nomina no existe.';        
                }
            }
            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }

    private function uploadNominaFiles($nomina_id)
    {
        if(count($_FILES) > 0 ){

            if(isset($_FILES['excel_files'])){
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
                            $nomina_excel->nomina_id = $nomina_id;
                            $nomina_excel->file_url = $final_image_name;
                            $nomina_excel->name = $vef;
                            $nomina_excel->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

            if(isset($_FILES['dispersion_files'])){
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
                            $nomina_dispersion->nomina_id = $nomina_id;
                            $nomina_dispersion->file_url = $final_image_name;
                            $nomina_dispersion->name = $vdf;
                            $nomina_dispersion->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

        }
    }//

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
        try {
            $this->res['data'] = $_FILES;
            $this->res['input'] = $_REQUEST;
            $this->res['OK'] = 'si es tes';

            /*if(count($_FILES) > 0 ){


                
            }*/
            $this->status_code = 200;
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
                $nomina = Nomina::find($id);
                if($nomina){
                    $nomina->delete();
                    $nomina_excel = NominaExcel::where('nomina_id', $id)->get();
                    if(count($nomina_excel) > 0){
                        foreach ($nomina_excel as $kne => $vne) {
                            $nw = NominaExcel::find($vne->id);
                            if($nw) $nw->delete();    
                        }
                    }

                    $nomina_dispersion = NominaDispersion::where('nomina_id', $id)->get();
                    if(count($nomina_dispersion) > 0){
                        foreach ($nomina_dispersion as $knd => $vnd) {
                            $nd = NominaDispersion::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $this->res['message'] = 'Nomina eliminada correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El registro de Nomina no existe.';
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
