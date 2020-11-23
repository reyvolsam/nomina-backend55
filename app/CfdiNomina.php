<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CfdiNomina extends Model
{
    use SoftDeletes;

    protected $table = 'cfdi_nomina';

    protected $fillable = ['date', 'period', 'file_pdf', 'file_xml', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

}