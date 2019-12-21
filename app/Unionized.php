<?php
namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Unionized extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
}