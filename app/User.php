<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable, SoftDeletes;

    protected $dates = ['deleted_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function Group()
    {
        return $this->belongsTo('App\Group');
    }//Group()

    public function Company(){
        return $this->hasMany('App\CompanyUser');
    }

    public function assigned_companies(){
        return $this->belongsToMany('App\Company', 'company_users');
    }

    public function CompanyUser(){
        return $this->belongsToMany('App\Company', 'company_users');
    }

}
