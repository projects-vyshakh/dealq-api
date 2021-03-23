<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSellersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sellers', function (Blueprint $table) {
            $table->id();
            $table->smallInteger('user_id')->nullable()->unsigned()->default(0);
            $table->integer('seller_categories')->default(0);
            $table->string('brand_name')->nullable();
            $table->string('address')->nullable();
            $table->integer('pincode')->nullable();
            $table->string('location')->nullable();
            $table->string('fssai_license')->nullable();
            $table->string('gst')->nullable();
            $table->string('promocode')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sellers');
    }
}
