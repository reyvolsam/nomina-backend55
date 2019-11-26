<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Nomina extends Model
{
    use SoftDeletes;

    protected $table = 'nomina';

    protected $fillable = ['date', 'period', 'obra', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    public function nomina_excel(){
        return $this->hasMany('App\NominaExcel');
    }//nomina_excel()

    public function nomina_dispersion(){
        return $this->hasMany('App\NominaDispersion');
    }//nomina_dispersion()

}////
