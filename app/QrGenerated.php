<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QrGenerated extends Model
{
    protected $table    = 'qr_generated';
    protected $fillable = [
        'product_id', 'user_id', 'code', 'created_at', 'updated_at'
    ];
}
