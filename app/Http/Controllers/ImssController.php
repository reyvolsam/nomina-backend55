<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imss;
use App\ImssFile;
use App\ImssImpuesto;
use App\ImssInfonavit;
use App\ImssPagoImpuesto;
use App\ImssPagoImss;

class ImssController extends Controller
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
            $list = Imss::with('imss', 'impuesto', 'infonavit', 'pago_imss', 'pago_impuesto')->get();
            if(count($list) > 0){
                $this->res['data'] = $list;

                foreach ($list as $kl => $vl) {
                    $vl->loader = false;
                    if(count($vl->imss) > 0){
                        foreach ($vl->imss as $ne => $vne){
                            $vne->file_url = asset('imss/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                    if(count($vl->impuesto) > 0){
                        foreach ($vl->impuesto as $ne => $vne){
                            $vne->file_url = asset('imss/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                    if(count($vl->infonavit) > 0){
                        foreach ($vl->infonavit as $ne => $vne){
                            $vne->file_url = asset('imss/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                    if(count($vl->pago_imss) > 0){
                        foreach ($vl->pago_imss as $ne => $vne){
                            $vne->file_url = asset('imss/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                    if(count($vl->pago_impuesto) > 0){
                        foreach ($vl->pago_impuesto as $ne => $vne){
                            $vne->file_url = asset('imss/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                }
            } else {
                $this->res['message'] = 'No hay registros de Emisiones hasta el momento.';
            }
            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//

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
                $imss = new Imss();
                $imss->date   = $_REQUEST['date'];
                $imss->period = $_REQUEST['period'];
                $imss->save();

                $this->uploadFiles($imss->id);
            } else {
                $imss = Imss::find($id);
                if($imss){
                    $imss->date   = $_REQUEST['date'];
                    $imss->period = $_REQUEST['period'];
                    $imss->save();
                    
                    $this->uploadFiles($imss->id);

                    if(isset($_REQUEST['imss_edit'])){
                        $imss_edit = $_REQUEST['imss_edit'];
                        if(count($imss_edit) > 0){
                            foreach ($imss_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteD = ImssFile::find($vde['id']);
                                    if($deleteD) $deleteD->delete();
                                }
                            }
                        }
                    }

                    if(isset($_REQUEST['infonavit_edit'])){
                        $infonavit_edit = $_REQUEST['infonavit_edit'];
                        if(count($infonavit_edit) > 0){
                            foreach ($infonavit_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteD = ImssInfonavit::find($vde['id']);
                                    if($deleteD) $deleteD->delete();
                                }
                            }
                        }
                    }

                    if(isset($_REQUEST['impuesto_edit'])){
                        $impuesto_edit = $_REQUEST['impuesto_edit'];
                        if(count($impuesto_edit) > 0){
                            foreach ($impuesto_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteD = ImssImpuesto::find($vde['id']);
                                    if($deleteD) $deleteD->delete();
                                }
                            }
                        }
                    }

                    if(isset($_REQUEST['pago_imss_edit'])){
                        $pago_imss_edit = $_REQUEST['pago_imss_edit'];
                        if(count($pago_imss_edit) > 0){
                            foreach ($pago_imss_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteD = ImssPagoImss::find($vde['id']);
                                    if($deleteD) $deleteD->delete();
                                }
                            }
                        }
                    }

                    if(isset($_REQUEST['pago_impuesto_edit'])){
                        $pago_impuesto_edit = $_REQUEST['pago_impuesto_edit'];
                        if(count($pago_impuesto_edit) > 0){
                            foreach ($pago_impuesto_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteD = ImssPagoImpuesto::find($vde['id']);
                                    if($deleteD) $deleteD->delete();
                                }
                            }
                        }
                    }

                } else {
                    $this->res['message'] = 'Este registro de emision no existe.';        
                }
            }
            $this->status_code = 200;
        } catch(\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.'.$e;
            $this->status_code = 500;
        }
        return response()->json($this->res, $this->status_code);
    }//

    public function uploadFiles($imss_id)
    {
        if(count($_FILES) > 0 ){

            if(isset($_FILES['imss_files'])){
                if(count($_FILES['imss_files']['name'])){
                    foreach ($_FILES['imss_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['imss_files']['tmp_name'][$kdf], 'imss/'.basename($final_image_name))){
                            $imss_file = new ImssFile();
                            $imss_file->imss_id = $imss_id;
                            $imss_file->file_url = $final_image_name;
                            $imss_file->name = $vdf;
                            $imss_file->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

            if(isset($_FILES['infonavit_files'])){
                if(count($_FILES['infonavit_files']['name'])){
                    foreach ($_FILES['infonavit_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['infonavit_files']['tmp_name'][$kdf], 'imss/'.basename($final_image_name))){
                            $imss_file = new ImssInfonavit();
                            $imss_file->imss_id = $imss_id;
                            $imss_file->file_url = $final_image_name;
                            $imss_file->name = $vdf;
                            $imss_file->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

            if(isset($_FILES['impuesto_files'])){
                if(count($_FILES['impuesto_files']['name'])){
                    foreach ($_FILES['impuesto_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['impuesto_files']['tmp_name'][$kdf], 'imss/'.basename($final_image_name))){
                            $imss_file = new ImssImpuesto();
                            $imss_file->imss_id = $imss_id;
                            $imss_file->file_url = $final_image_name;
                            $imss_file->name = $vdf;
                            $imss_file->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

            if(isset($_FILES['pago_imss_files'])){
                if(count($_FILES['pago_imss_files']['name'])){
                    foreach ($_FILES['pago_imss_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['pago_imss_files']['tmp_name'][$kdf], 'imss/'.basename($final_image_name))){
                            $imss_file = new ImssPagoImss();
                            $imss_file->imss_id = $imss_id;
                            $imss_file->file_url = $final_image_name;
                            $imss_file->name = $vdf;
                            $imss_file->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

            if(isset($_FILES['pago_impuesto_files'])){
                if(count($_FILES['pago_impuesto_files']['name'])){
                    foreach ($_FILES['pago_impuesto_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['pago_impuesto_files']['tmp_name'][$kdf], 'imss/'.basename($final_image_name))){
                            $imss_file = new ImssPagoImpuesto();
                            $imss_file->imss_id = $imss_id;
                            $imss_file->file_url = $final_image_name;
                            $imss_file->name = $vdf;
                            $imss_file->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

        }
    }//uploadFiles()

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
        try{
            if(is_numeric($id)){
                $imss = Imss::find($id);
                if($imss){
                    $imss->delete();
                    
                    $imss_file = ImssFile::where('imss_id', $id)->get();
                    if(count($imss_file) > 0){
                        foreach ($imss_file as $knd => $vnd) {
                            $nd = ImssFile::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $infonavit_files = ImssInfonavit::where('imss_id', $id)->get();
                    if(count($infonavit_files) > 0){
                        foreach ($infonavit_files as $knd => $vnd) {
                            $nd = ImssInfonavit::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $impuesto_files = ImssImpuesto::where('imss_id', $id)->get();
                    if(count($impuesto_files) > 0){
                        foreach ($impuesto_files as $knd => $vnd) {
                            $nd = ImssImpuesto::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $pago_impuesto_files = ImssPagoImpuesto::where('imss_id', $id)->get();
                    if(count($pago_impuesto_files) > 0){
                        foreach ($pago_impuesto_files as $knd => $vnd) {
                            $nd = ImssPagoImpuesto::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $pago_imss_files = ImssPagoImss::where('imss_id', $id)->get();
                    if(count($pago_imss_files) > 0){
                        foreach ($pago_imss_files as $knd => $vnd) {
                            $nd = ImssPagoImss::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $this->res['message'] = 'Emision eliminada correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'El registro de emision no existe.';
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


    public function searchImss(){
        try {
            $data = $this->request->all();

            $list = Imss::with('imss', 'impuesto', 'infonavit', 'pago_imss', 'pago_impuesto');

        if ($data['date']) {
            $listNomina = $list->where('date', 'LIKE' , '%' . $data['date'] . '%');
        }

        if ($data['period']) {
            $list = $list->where('period', 'LIKE' , '%' . $data['period'] . '%');
        }


        $listFilter = $list->get();

        

        if (count($listFilter) > 0) {

            foreach ($listFilter as $kl => $vl) {
                $vl->loader = false;
                if(count($vl->imss) > 0){
                    foreach ($vl->imss as $ne => $vne){
                        $vne->file_url = asset('imss/'.$vne->file_url);
                        $vne->deleted = false;
                    }
                }
                if(count($vl->impuesto) > 0){
                    foreach ($vl->impuesto as $ne => $vne){
                        $vne->file_url = asset('imss/'.$vne->file_url);
                        $vne->deleted = false;
                    }
                }
                if(count($vl->infonavit) > 0){
                    foreach ($vl->infonavit as $ne => $vne){
                        $vne->file_url = asset('imss/'.$vne->file_url);
                        $vne->deleted = false;
                    }
                }
                if(count($vl->pago_imss) > 0){
                    foreach ($vl->pago_imss as $ne => $vne){
                        $vne->file_url = asset('imss/'.$vne->file_url);
                        $vne->deleted = false;
                    }
                }
                if(count($vl->pago_impuesto) > 0){
                    foreach ($vl->pago_impuesto as $ne => $vne){
                        $vne->file_url = asset('imss/'.$vne->file_url);
                        $vne->deleted = false;
                    }
                }
            }

            $this->res['data'] = $listFilter;
            $this->res['message'] = '';
        } else {
            $this->res['message'] = 'No se encontraron resultados con esos datos de busqueda';
        }
        $this->status_code = 200;

    } catch (\Exception $e) {
        $this->res['message'] = 'Error en el Sistema.' . $e;
        $this->status_code = 500;
    }
    
        return response()->json($this->res, $this->status_code);
    }
}
