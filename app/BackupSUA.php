<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BackupSUA extends Model
{
    use SoftDeletes;

    protected $table = 'backup_sua';

    protected $fillable = ['date', 'period', 'file_backup', 'file_amount', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

}