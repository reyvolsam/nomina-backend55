<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ReceiptTransference2 extends Model
{
    use SoftDeletes;

    protected $table = 'payment_receipts_transference2';

    protected $fillable = ['payment_receipt_id', 'name', 'file_url', 'created_at', 'updated_at'];
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];
}
