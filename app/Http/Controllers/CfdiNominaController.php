<?php

namespace App\Http\Controllers;

use App\CfdiNomina;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Validator;

class CfdiNominaController extends Controller
{
    private $res = [];
    private $request;

    function __construct(Request $request)
    {
        $this->request = $request;
        $this->res['message'] = '';
        $this->res['test'] = '';
        $this->res['data'] = [];
        $this->status_code = 200;
    }//__construct()

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        //
        try {

            $cfdi = CfdiNomina::all();
            $cfdi_files = [];

            if (count($cfdi) > 0) {

                
                $this->res['data'] = $this->getAllData($cfdi);
                $this->status_code = 200;
            } else {
                $this->res['message'] = 'No hay CFDI registrados hasta el momento.';
                $this->status_code = 200;
            }

            // $this->res['message'] = 'Test success';
            
            
        } catch (\Exception $e) {
            $this->res['message'] = 'Error en la Base de Datos.' . $e;
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
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        try {
            $validator = Validator::make($this->request->all(), [
                'date'              => 'required',
                'period'             => 'required',
            ]);
    
            if (!$validator->fails()) {
                $data = $this->request->all();

                // $fileNamePdf = $data['file_name_pdf'] != null ? str_replace(' ', '_',$data['file_name_pdf']): null;
                // $fileNameXML = $data['file_name_xml'] != null ? str_replace(' ', '_',$data['file_name_xml']): null;

                $fileNamePdf = $data['file_name_pdf'];
                $fileNameXML = $data['file_name_xml'];


                $cfdi = new CfdiNomina;
                $cfdi->date = $data['date'];
                $cfdi->period = $data['period'];
                $cfdi->file_pdf = $fileNamePdf;
                $cfdi->file_xml = $fileNameXML;
                $cfdi->save();
                

                if ($data['file_pdf']) {
                    $fileNamePdf = str_replace(' ', '_',$data['file_name_pdf']);
                    $this->res['message'] = $cfdi->id;
                    Storage::put('public/cfdiNomina/' . $cfdi->id . '/' . $fileNamePdf, base64_decode($data['file_pdf']));
                    # code...
                }

                if ($data['file_xml']) {
                    $this->res['message'] = $cfdi->id;
                    Storage::put('public/cfdiNomina/' . $cfdi->id . '/' . $fileNameXML, base64_decode($data['file_xml']));
                    # code...
                }


    
               $this->res['message'] = 'CFDI de nomina guardado correctamente';
               $this->status_code = 200;
                
            } else {
                $this->res['message'] = 'Por favor complete los campos.';
                $this->status_code = 422;
            }
        } catch (\Exception $e) {
            $this->res['message'] = 'Error en el sistema.' . $e;
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
    public function update($id)
    {
        //
        try {
            $validator = Validator::make($this->request->all(), [
                'date'              => 'required',
                'period'             => 'required',
            ]);

            
    
            if (!$validator->fails()) {
                $data = $this->request->all();
                // $fileNamePdf = str_replace(' ', '_',$data['file_name_pdf']);
                // $fileNameXML = str_replace(' ', '_',$data['file_name_xml']);

                $fileNamePdf = $data['file_name_pdf'];
                $fileNameXML = $data['file_name_xml'];

                $cfdi_exists = CfdiNomina::find($id);

                if ($cfdi_exists != null) {


                    $cfdi = new CfdiNomina;
                    $cfdi->date = $data['date'];
                    $cfdi->period = $data['period'];
                    // $cfdi->file_pdf = $data['file_name_pdf'];
                    // $cfdi->file_xml = $data['file_name_xml'];

                    if ($cfdi_exists->file_pdf == null && $data['file_pdf'] != null) {
                        $this->res['test'] = 'se va a crear';
                        $cfdi->file_pdf = $fileNamePdf;
                    // $cfdi->file_xml = $data['file_name_xml'];
                        Storage::put('public/cfdiNomina/' . $id . '/' . $fileNamePdf, base64_decode($data['file_pdf']));
                        
                        # code...
                    } else if($cfdi_exists->file_pdf != null && $data['file_pdf'] == null){
                        $cfdi->file_pdf = null;
                        $this->res['test'] = 'se quitara';
                    }else if($cfdi_exists->file_pdf != $data['file_pdf']){
                        $this->res['test'] = 'se actualizara';
                        $cfdi->file_pdf = $fileNamePdf;
                        Storage::put('public/cfdiNomina/' . $id . '/' . $fileNamePdf, base64_decode($data['file_pdf']));
                    }

                    if ($cfdi_exists->file_xml == null && $data['file_xml'] != null) {
                        $this->res['test'] = 'se va a crear';
                        $cfdi->file_xml = $fileNameXML;
                    // $cfdi->file_xml = $data['file_name_xml'];
                        Storage::put('public/cfdiNomina/' . $id . '/' . $fileNameXML, base64_decode($data['file_xml']));
                        
                        # code...
                    } else if($cfdi_exists->file_xml != null && $data['file_xml'] == null){
                        $cfdi->file_xml = null;
                        $this->res['test'] = 'se quitara';
                    }else if($cfdi_exists->file_xml != $data['file_xml']){
                        $this->res['test'] = 'se actualizara';
                        $cfdi->file_xml = $fileNameXML;
                        Storage::put('public/cfdiNomina/' . $id . '/' . $fileNameXML, base64_decode($data['file_xml']));
                    }

                    $id_doc = CfdiNomina::updateOrCreate(['id' => $id], $cfdi->toArray())->id;



                    $this->res['message'] = 'CFDI actualizado correctamente.';
                    $this->status_code = 200;
                    # code...
                }else {
                    $this->res['message'] = 'No existe un CFDI de nomina con ese id.';
                    $this->status_code = 404;
                }

                $cfdi = new CfdiNomina;
                $cfdi->date = $data['date'];
                $cfdi->period = $data['period'];
                $cfdi->file_pdf = $data['file_name_pdf'];
                $cfdi->file_xml = $data['file_name_xml'];
               
                
            } else {
                $this->res['message'] = 'Por favor complete los campos.';
                $this->status_code = 422;
            }
        } catch (\Exception $e) {
            $this->res['message'] = 'Error en el sistema.' . $e;
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
        //
        try {
            if (is_numeric($id)) {
                $cfdi_exist = CfdiNomina::find($id);

                if ($cfdi_exist) {
                    $cfdi_exist->delete();
                    $this->res['message'] = 'CFDI eliminado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'CFDI no existe.';
                    $this->status_code = 422;
                }
            } else {
                $this->res['message'] = 'Id incorrecto.';
                $this->status_code = 422;
            }
        } catch (\Exception $e) {
            $this->res['message'] = 'Error en el sistema.' . $e;
            $this->status_code = 422;
        }

        return response()->json($this->res, $this->status_code);
    }

    public function searchCfdiNomina(){
        try {
            $data = $this->request->all();

        $listCFDI = CfdiNomina::select();

        if ($data['date']) {
            $listCFDI = $listCFDI->where('date', 'LIKE' , '%' . $data['date'] . '%');
        }

        if ($data['period']) {
            $listCFDI = $listCFDI->where('period', 'LIKE' , '%' . $data['period'] . '%');
        }

        $listFilter = $listCFDI->get();

        if (count($listFilter) > 0) {

            $this->res['data'] = $this->getAllData($listFilter);
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

    public function getAllData($list){

        $listFiles = [];

        foreach ($list as $key => $value) {
            $value['file_pdf_route'] = null;
            $value['file_xml_route'] = null;
            if ($value['file_pdf'] != null) {
                $value['file_pdf_route'] = asset('storage/cfdiNomina/' . $value['id'] . '/' . $value['file_pdf']);# code...
            }

            if ($value['file_xml'] != null) {
                $value['file_xml_route'] = asset('storage/cfdiNomina/' . $value['id'] . '/' . $value['file_xml']);# code...
            }

            array_push($listFiles, $value);
        }

        return $listFiles;

    }
}
