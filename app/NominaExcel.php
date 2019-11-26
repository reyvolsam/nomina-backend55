<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class NominaExcel extends Model
{
    use SoftDeletes;

    protected $table = 'nomina_excel';

    protected $fillable = ['nomina_id', 'name', 'file_url', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];
}
