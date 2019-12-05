<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Receipts;
use App\ReceiptXML;
use App\ReceiptTransference1;
use App\ReceiptTransference2;

class ReceiptsController extends Controller
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
            $list = Receipts::with('xml_payment', 'payment_transference_1', 'payment_transference_2')->get();

            if(count($list) > 0){
                $this->res['data'] = $list;

                foreach ($list as $kl => $vl) {
                    $vl->loader = false;
                    if(count($vl->xml_payment) > 0){
                        foreach ($vl->xml_payment as $ne => $vne){
                            $vne->file_url = asset('receipts/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }

                    if(count($vl->payment_transference_1) > 0){
                        foreach ($vl->payment_transference_1 as $ne => $vne){
                            $vne->file_url = asset('receipts/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }

                    if(count($vl->payment_transference_2) > 0){
                        foreach ($vl->payment_transference_2 as $ne => $vne){
                            $vne->file_url = asset('receipts/'.$vne->file_url);
                            $vne->deleted = false;
                        }
                    }
                }

            } else {
                $this->res['message'] = 'No hay Recibos hasta el momento.';
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
    public function store(Request $request)
    {
        try {
            $this->res['data'] = $_FILES;
            $this->res['input'] = $_REQUEST;

            $id   = $_REQUEST['id'];

            if($id == 'null'){
                $receipt = new Receipts();
                $receipt->date   = $_REQUEST['date'];
                $receipt->period = $_REQUEST['period'];
                $receipt->save();

                $this->uploadFiles($receipt->id);
            } else {
                $receipt = Receipts::find($id);
                if($receipt){
                    $receipt->date   = $_REQUEST['date'];
                    $receipt->period = $_REQUEST['period'];
                    $receipt->save();
                    
                    $this->uploadFiles($receipt->id);

                    if(isset($_REQUEST['xml_edit'])){
                        $xml_edit = $_REQUEST['xml_edit'];
                        if(count($xml_edit) > 0){
                            foreach ($xml_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteX = ReceiptXML::find($vde['id']);
                                    if($deleteX) $deleteX->delete();
                                }
                            }
                        }
                    }

                    if(isset($_REQUEST['transference1_edit'])){
                        $transference1_edit = $_REQUEST['transference1_edit'];
                        if(count($transference1_edit) > 0){
                            foreach ($transference1_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteT1 = ReceiptTransference1::find($vde['id']);
                                    if($deleteT1) $deleteT1->delete();
                                }
                            }
                        }
                    }

                    if(isset($_REQUEST['transference2_edit'])){
                        $transference2_edit = $_REQUEST['transference2_edit'];
                        if(count($transference2_edit) > 0){
                            foreach ($transference2_edit as $kde => $vde) {
                                if($vde['deleted'] == 'true'){
                                    $deleteT2 = ReceiptTransference2::find($vde['id']);
                                    if($deleteT2) $deleteT2->delete();
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
    }////

    private function uploadFiles($receipt_id)
    {
        if(count($_FILES) > 0 ){

            if(isset($_FILES['xml_files'])){
                if(count($_FILES['xml_files']['name'])){
                    foreach ($_FILES['xml_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['xml_files']['tmp_name'][$kdf], 'receipts/'.basename($final_image_name))){
                            $receipt_xml = new ReceiptXML();
                            $receipt_xml->payment_receipt_id = $receipt_id;
                            $receipt_xml->file_url = $final_image_name;
                            $receipt_xml->name = $vdf;
                            $receipt_xml->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

            if(isset($_FILES['transference1_files'])){
                if(count($_FILES['transference1_files']['name'])){
                    foreach ($_FILES['transference1_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['transference1_files']['tmp_name'][$kdf], 'receipts/'.basename($final_image_name))){
                            $receipt_t1 = new ReceiptTransference1();
                            $receipt_t1->payment_receipt_id = $receipt_id;
                            $receipt_t1->file_url = $final_image_name;
                            $receipt_t1->name = $vdf;
                            $receipt_t1->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

            if(isset($_FILES['transference2_files'])){
                if(count($_FILES['transference2_files']['name'])){
                    foreach ($_FILES['transference2_files']['name'] as $kdf => $vdf) {
                        $porciones = explode(".", $vdf);
                        $ext = $porciones[count($porciones)-1];
                        unset($porciones[count($porciones)-1]);

                        list($txt, $ext) = explode(".", $vdf);

                        $rand = rand(1, 500);
                        $final_image_name = $rand."_".time().".".$ext;
                        if(move_uploaded_file($_FILES['transference2_files']['tmp_name'][$kdf], 'receipts/'.basename($final_image_name))){
                            $receipt_t2 = new ReceiptTransference2();
                            $receipt_t2->payment_receipt_id = $receipt_id;
                            $receipt_t2->file_url = $final_image_name;
                            $receipt_t2->name = $vdf;
                            $receipt_t2->save();
                        } else {
                            $this->res['message'] = 'No se puedo procesar la solicitud.';            
                            $this->status_code = 202;
                        }
                    }
                }
            }

        }
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
        try{
            if(is_numeric($id)){
                $receipt = Receipt::find($id);
                if($receipt){
                    $receipt->delete();
                    $this->status_code = 200;

                    $receipt_xml = ReceiptXML::where('receipt_payment_id', $id)->get();
                    if(count($receipt_xml) > 0){
                        foreach ($receipt_xml as $knd => $vnd) {
                            $nd = ReceiptXML::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $receipt_transference1 = ReceiptTransference1::where('receipt_payment_id', $id)->get();
                    if(count($receipt_transference1) > 0){
                        foreach ($receipt_transference1 as $knd => $vnd) {
                            $nd = ReceiptTransference1::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }

                    $receipt_transference2 = ReceiptTransference2::where('receipt_payment_id', $id)->get();
                    if(count($receipt_transference2) > 0){
                        foreach ($receipt_transference2 as $knd => $vnd) {
                            $nd = ReceiptTransference2::find($vnd->id);
                            if($nd) $nd->delete();    
                        }
                    }
                } else {
                    $this->res['message'] = 'El recibo de no existe.';
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
