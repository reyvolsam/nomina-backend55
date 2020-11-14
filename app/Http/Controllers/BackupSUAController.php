<?php

namespace App\Http\Controllers;

use App\BackupSua;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\MonthlyIsuue;
use Illuminate\Support\Facades\Storage;
use Validator;

class BackupSUAController extends Controller
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
         //
         try {

            $suaList = BackupSua::with('monthly_files_current')->get();


            if (count($suaList) > 0) {

                $this->res['data'] = $this->getAllData($suaList);
                $this->status_code = 200;
            } else {
                $this->res['message'] = 'No hay respaldos SUA registrados hasta el momento.';
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
        //
        try {
            $validator = Validator::make($this->request->all(), [
                'date'              => 'required',
                'period'             => 'required',
            ]);

            // $this->res['test'] = 
    
            if (!$validator->fails()) {
                $data = $this->request->all();

                // $this->res['test'] = $data['monthly_isuue'];

                $fileNameBackup = $data['file_name_backup'] != null ? str_replace(' ', '_',$data['file_name_backup']): null;
                $fileNameAmount = $data['file_name_amount'] != null ? str_replace(' ', '_',$data['file_name_amount']): null;

                $sua = new BackupSua();
                $sua->date = $data['date'];
                $sua->period = $data['period'];
                $sua->file_backup = $fileNameBackup;
                $sua->file_amount = $fileNameAmount;
                $sua->save();
                

                if ($data['file_backup']) {
                    // $fileNameBackup = str_replace(' ', '_',$data['file_name_pdf']);
                    $this->res['message'] = $sua->id;
                    Storage::put('public/backupSUA/' . $sua->id . '/' . $fileNameBackup, base64_decode($data['file_backup']));
                    # code...
                }

                if ($data['file_amount']) {
                    $this->res['message'] = $sua->id;
                    Storage::put('public/backupSUA/' . $sua->id . '/' . $fileNameAmount, base64_decode($data['file_amount']));
                    # code...
                }

                if (count($data['monthly_files_new']) > 0) {
                    # code...
                    foreach ($data['monthly_files_new'] as $key => $value) {
                        $monthly = new MonthlyIsuue();
                        $monthly->backup_sua_id = $sua->id;
                        $monthly->file_name = $value['file_name'];
                        $monthly->save();

                        Storage::put('public/monthlyIsuue/' . $sua->id . '/' . $value['file_name'], base64_decode($value['file_base']));
                        # code...
                    }
                }


    
               $this->res['message'] = 'Respaldo SUA guardado correctamente.';
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
                $fileNameBackup = str_replace(' ', '_',$data['file_name_backup']);
                $fileNameAmount = str_replace(' ', '_',$data['file_name_amount']);

                $sua_exists = BackupSua::find($id);

                if ($sua_exists != null) {


                    $sua = new BackupSua;
                    $sua->date = $data['date'];
                    $sua->period = $data['period'];

                    if ($sua_exists->file_backup == null && $data['file_backup'] != null) {
                        $this->res['test'] = 'se va a crear';
                        $sua->file_backup = $fileNameBackup;
                    // $sua->file_amount = $data['file_name_amount'];
                        Storage::put('public/backupSUA/' . $id . '/' . $fileNameBackup, base64_decode($data['file_backup']));
                        
                        # code...
                    } else if($sua_exists->file_backup != null && $data['file_backup'] == null){
                        $sua->file_backup = null;
                        $this->res['test'] = 'se quitara';
                    }else if($sua_exists->file_backup != $data['file_backup']){
                        $this->res['test'] = 'se actualizara';
                        $sua->file_backup = $fileNameBackup;
                        Storage::put('public/backupSUA/' . $id . '/' . $fileNameBackup, base64_decode($data['file_backup']));
                    }

                    if ($sua_exists->file_amount == null && $data['file_amount'] != null) {
                        $this->res['test'] = 'se va a crear';
                        $sua->file_amount = $fileNameAmount;
                    // $sua->file_amount = $data['file_name_amount'];
                        Storage::put('public/backupSUA/' . $id . '/' . $fileNameAmount, base64_decode($data['file_amount']));
                        
                        # code...
                    } else if($sua_exists->file_amount != null && $data['file_amount'] == null){
                        $sua->file_amount = null;
                        $this->res['test'] = 'se quitara';
                    }else if($sua_exists->file_amount != $data['file_amount']){
                        $this->res['test'] = 'se actualizara';
                        $sua->file_amount = $fileNameAmount;
                        Storage::put('public/backupSUA/' . $id . '/' . $fileNameAmount, base64_decode($data['file_amount']));
                    }


                    if (count($data['monthly_files_new']) > 0) {
                        $this->res['test'] = 'hay nuevos archivos para guardar';
                        foreach ($data['monthly_files_new'] as $key => $editFile) {
                            $monthly = new MonthlyIsuue();
                            $monthly->backup_sua_id = $id;
                            $monthly->file_name = $editFile['file_name'];
                            $monthly->save();
    
                            Storage::put('public/monthlyIsuue/' . $id . '/' . $editFile['file_name'], base64_decode($editFile['file_base']));
                        }

                    }

                    if (count($data['monthly_files_current']) > 0) {
                        $this->res['test'] = 'hay nuevos archivos para editar';
                        foreach ($data['monthly_files_current'] as $key => $editFile) {
                            # code...
                            if ($editFile['delete_file']) {
                                $delFile = MonthlyIsuue::find($editFile['id']);
                                if($delFile) $delFile->delete();
                            }
                        }
                        
                    }

                    $id_doc = BackupSua::updateOrCreate(['id' => $id], $sua->toArray())->id;



                    $this->res['message'] = 'Respaldo SUA actualizado correctamente.';
                    $this->status_code = 200;
                    # code...
                }else {
                    $this->res['message'] = 'No existe un Respaldo SUA con ese id.';
                    $this->status_code = 404;
                }
                
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
                $sua_exist = BackupSua::find($id);

                if ($sua_exist) {
                    $sua_exist->delete();
                    $this->res['message'] = 'Respaldo SUA eliminado correctamente.';
                    $this->status_code = 200;
                } else {
                    $this->res['message'] = 'Respaldo SUA no existe.';
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

    public function searchBackupSua(){
        try {
            $data = $this->request->all();

        $listSua = BackupSua::with('monthly_files_current');
        $listFilterFiles = [];

        if ($data['date']) {
            $listSua = $listSua->where('date', 'LIKE' , '%' . $data['date'] . '%');
        }

        if ($data['period']) {
            $listSua = $listSua->where('period', 'LIKE' , '%' . $data['period'] . '%');
        }

        $listFilter = $listSua->get();

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

    public function getAllData($listFilter){
        $listFilterFiles = [];
        foreach ($listFilter as $key => $value) {
            $value['file_backup_route'] = null;
            $value['file_amount_route'] = null;
            if ($value['file_backup'] != null) {
                $value['file_backup_route'] = asset('storage/backupSUA/' . $value['id'] . '/' . $value['file_backup']);# code...
            }

            if ($value['file_amount'] != null) {
                $value['file_amount_route'] = asset('storage/backupSUA/' . $value['id'] . '/' . $value['file_amount']);# code...
            }

            if (count($value->monthly_files_current) > 0) {
                foreach ($value->monthly_files_current as $key => $m) {
                    $m->delete_file = false;
                    $m->file_route = asset('storage/monthlyIsuue/' . $value['id'] . '/' . $m->file_name);
                }
            }

            $value['file_name_backup'] = null;
            $value['file_name_amount'] = null;

            $value['monthly_files_new'] = [];

            array_push($listFilterFiles, $value);
        }

        return $listFilterFiles;
    }
}
