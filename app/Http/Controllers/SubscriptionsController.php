<?php

namespace App\Http\Controllers;

use App\Subscriptions;
use App\Traits\FunctionalTraits;
use Illuminate\Http\Request;

class SubscriptionsController extends Controller
{
    use FunctionalTraits;

    public $successStatus = 200;

    public function listSubscriptionPlans() {

        return response()->json([
            'code'  => 200,
            'status' => 'true',
            'message'=> 'List of All Plans',
            'data'  => $this->getSubscriptionPlans()
        ]);

    }

    public function addSubscription(Request $request) {
        $input  = $request->all();
        $today  = date('Y-m-d H:i:s');
        //$today  = date('Y-m-d', strtotime(' +4 months'));

        //Custom Validation Rules Traits
        $requestInputFields = ['seller', 'plan_code', 'payment_status'];
        $alertValues        = ['Seller', 'Plan', 'Payment'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'false'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->successStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'false'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->successStatus);
        }

        if (!$this->getUsersById($input['seller'])) {
            return response()->json([
                'code' => 200,
                'status' => false,
                'message' => $this->invalid('Seller'),
                'data'   => []
            ]);
        }

       if ($activeSubscription = $this->getActiveSubscription($input['plan_code'], $input['seller'])) {

           return response()->json([
               'code' => 200,
               'status' => false,
               'message' => 'Already exists an active subsciption.',
               'data'   => []
           ]);
       }

        $plan = $this->getSubscriptionPlanByCode($input['plan_code']);

       if ($plan) {
           $validity = $plan['validity'];
           $endDate = date('Y-m-d H:i:s', strtotime(' +'.$validity));
           $subscriptionStatus = "pending";

           if ($input['payment_status'] == 'paid') {
               $subscriptionStatus = 'active';
           }

           $dataArray = [
               'seller_id' => $input['seller'],
               'plan_code'  => $input['plan_code'],
               'start_date' => $today,
               'end_date'   => $endDate,
               'payment_status' => $input['payment_status'],
               'subscription_status' => $subscriptionStatus
           ];

           if (!Subscriptions::create($dataArray)) {
               return response()->json([
                   'code' => 200,
                   'status' => false,
                   'message' => $this->saveFail(),
                   'data'   => []
               ]);
           }

           return response()->json([
               'code' => 200,
               'status' => true,
               'message' => $this->saveSuccess(),
               'data'   => $this->getActiveSubscription($input['plan_code'], $input['seller'])
           ]);

       }

        return response()->json([
            'code' => 200,
            'status' => false,
            'message' => $this->invalid('Plan'),
            'data'   => []
        ]);




    }
}
