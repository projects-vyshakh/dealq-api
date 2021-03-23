<?php

use Illuminate\Database\Seeder;
    use Illuminate\Support\Facades\DB;

    class SellerCategoriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('seller_categories')->insert(
            [
                ['name'=>'wholesale'],
                ['name'=>'retail'],

            ]
        );
    }
}
