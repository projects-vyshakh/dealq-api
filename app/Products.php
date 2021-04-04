<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'sku', 'description','quantity','price','offer_price','category', 'uuid','is_active','sort_order', 'publish_status'
    ];

}
