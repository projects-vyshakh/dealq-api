<?php

namespace App\Traits;

use App\User;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Webpatser\Uuid\Uuid;

trait UtilityTraits{

    public function randomStringGenerator($length = 0){

        return Str::random($length);

    }

    public function randomNumberGenerator($length = 0) {
        $result = '';

        for($i = 0; $i < $length; $i++) {
            $result .= mt_rand(0, 9);
        }

        return $result;
    }

    public function UuidGenerator() {

        return Uuid::generate()->string;

    }

    public function getAccessToken() {

        if (isset($_SERVER['HTTP_ACCESS_TOKEN'])) {
            return [
                'status' => 'success',
                'message' => 'Valid Access Token',
                'data'    => ['Access-Token'=>$_SERVER['HTTP_ACCESS_TOKEN']]
            ];
        }
        else {
            return [
                'status' => 'error',
                'message' => 'Invalid Access Token',
                'data'    => ''
            ];
        }

    }

}
