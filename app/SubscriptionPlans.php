<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubscriptionPlans extends Model
{
    protected $fillable = [
        'plan_name',
        'plan_price',
        'plan_code',
        'real_validity',
        'extra_validity',
        'validity',
        'slots',
        'description',
        'is_active'
    ];
}
