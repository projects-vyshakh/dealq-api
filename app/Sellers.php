<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sellers extends Model
{
    protected $fillable = [
        'seller_categories',
        'brand_name',
        'address',
        'pincode',
        'location',
        'fssai_license',
        'gst',
        'user_id',
        'promocode'
    ];

    public function user() {
        return $this->belongsTo('App\User');
    }
}
