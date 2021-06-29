<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Receipts extends Model
{
    use SoftDeletes;

    protected $table = 'payment_receipts';

    protected $fillable = ['date', 'company_id', 'period', 'obra', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];

    public function xml_payment()
    {
        return $this->hasMany('App\ReceiptXML', 'payment_receipt_id');
    }//xml_payment()

    public function payment_transference_1()
    {
        return $this->hasMany('App\ReceiptTransference1', 'payment_receipt_id');
    }//xml_payment()

    public function payment_transference_2()
    {
        return $this->hasMany('App\ReceiptTransference2', 'payment_receipt_id');
    }//xml_payment()

    public function company()
    {
        return $this->belongsTo('App\Company');
    }
}
