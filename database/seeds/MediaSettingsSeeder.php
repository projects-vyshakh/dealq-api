<?php

use Illuminate\Database\Seeder;

class MediaSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('media_settings')->insert([
            'settings_name' => 'Images',
            'media_type'    => 'images',
            'allowed_extensions'    => json_encode(['jpg','png']),
            'created_at'    => now(),
            'updated_at'    => now()
        ]);
    }
}
