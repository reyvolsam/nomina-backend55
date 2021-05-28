<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FileHistory extends Model
{
    use SoftDeletes;

    protected $table = 'file_history';

    protected $fillable = ['work_id', 'file_type_id', 'file_url', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

   

}