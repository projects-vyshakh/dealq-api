<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customers extends Model
{
    protected $fillable = [
        'user_id', 'address', 'pincode', 'referral_code', 'location'
    ];
}
