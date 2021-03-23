<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UserSeeder::class);

        //$this->call(AttributeSetsSeeder::class);
        //$this->call(AttributesSeeder::class);
        //$this->call(SellerCategoriesSeeder::class);
        //$this->call(MediaSettingsSeeder::class);
        $this->call(SubscriptionPlansSeeder::class);
    }
}
