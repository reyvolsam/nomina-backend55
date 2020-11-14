<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MonthlyIsuue extends Model
{
    use SoftDeletes;

    protected $table = 'monthly_issue';

    // protected $fillable = ['id', 'backup_sua_id', 'file_name', 'created_at', 'updated_at'];
    // protected $guarded = ['id'];
    // protected $dates = ['deleted_at'];

}