<?php

namespace App\Traits;

use App\SubscriptionPlans;
use App\Subscriptions;

trait SubscriptionTraits {

    public function getSubscriptionPlans() {
        return SubscriptionPlans::where('is_active', 1)->get();
    }

    public function getActiveSubscription($planCode, $seller) {
        $today  = date('Y-m-d H:i:s');


        if ($planCode && $seller){

            return  Subscriptions::where('plan_code', $planCode)
                ->where('seller_id', $seller)
                ->where('end_date','>=',$today)
                ->where('subscription_status', 'active')
                ->first();
        }
    }

    public function getSubscriptionPlanByCode($planCode) {
        if ($planCode) {
            return SubscriptionPlans::where('plan_code', $planCode)->first();
        }
    }

    public function makeSubscriptionInactive($seller) {
        $today  = date('Y-m-d H:i:s');

        if ($seller) {
            $data = Subscriptions::where('seller_id', $seller)->where('subscription_status', 'active')->first();

            if ($data) {
                if ($data['end_date'] < $today) {
                    Subscriptions::where('seller_id', $seller)
                        ->where('subscription_status', 'active')->update(['subscription_status'=>'inactive']);

                    return false;
                }
                else {
                    return true;
                }
            }
        }

        return false;
    }
}
