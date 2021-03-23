<?php

use Illuminate\Database\Seeder;

class SubscriptionPlansSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('subscription_plans')->insert(
            [
               [
                    'plan_name'=>'Basic Plan',
                    'plan_price'=>1500,
                    'plan_code'=>'basic1500',
                    'description'=>'1 month free+ 3 months+ 5 adv slot'
               ],
               [
                    'plan_name'=>'Basic Plan',
                    'plan_price'=>2000,
                    'plan_code'=>'basic2000',
                    'description'=>'1 month free+ 3 months+ 10 adv slot'
               ],
               [
                    'plan_name'=>'Advanced Plan',
                    'plan_price'=>2500,
                    'plan_code'=>'basic2500',
                    'description'=>'1 month free+ 6 months+ 5 adv slot'
               ],
               [
                    'plan_name'=>'Super Plan',
                    'plan_price'=>3000,
                    'plan_code'=>'basic3000',
                    'description'=>'1 month free+ 6 months+ 10 adv slot'
               ]
            ]
        );
    }
}
