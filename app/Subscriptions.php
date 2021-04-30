<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Subscriptions extends Model
{
    protected $fillable = [
        'seller_id',
        'plan_code',
        'start_date',
        'end_date',
        'payment_status',
        'subscription_status',

    ];
}
