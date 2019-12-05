<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Imss extends Model
{
    use SoftDeletes;

    protected $table = 'imss';

    protected $fillable = ['date', 'period', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    public function imss(){
        return $this->hasMany('App\ImssFile');
    }//imss_file()

    public function impuesto(){
        return $this->hasMany('App\ImssImpuesto');
    }//imss_impuesto()

    public function infonavit(){
        return $this->hasMany('App\ImssInfonavit');
    }//imss_impuesto()

    public function pago_imss(){
        return $this->hasMany('App\ImssPagoImss');
    }//imss_pago_imss()

    public function pago_impuesto(){
        return $this->hasMany('App\ImssPagoImpuesto');
    }//imss_pago_imss()

}////
