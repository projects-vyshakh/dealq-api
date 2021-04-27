<?php

namespace App\Traits;

use App\MediaGalleries;
use App\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use PHPUnit\Framework\Exception;
use Webpatser\Uuid\Uuid;

trait UserTraits{

    public function getUserByAccessToken() {
        $token  = $this->getAccessToken();
        if ($token['status'] == 'error') {
            return $token;
        }



        if ($token['data']) {
            $tokenData = (array)DB::table('oauth_access_tokens')->find($token['data']['Access-Token']);

            if ($tokenData) {
                return [
                    'status' => 'success',
                    'message' => 'Valid Access Token',
                    'data'    => User::find($tokenData['user_id'])
                ];

            }
        }
    }

    public function getUsersByRoleAndId($role, $id) {

        try{

            $users = User::join('customers as c','c.user_id', '=', 'users.id')
                ->where('users.id', $id)
                ->where('users.role', $role)
                ->where('users.status', 1)
                ->get();

            $data = [];

            foreach ($users as $user ){
                $mediaGallery = MediaGalleries::where('uuid', $user['uuid'])->get();


                $data[] = [
                    'id'                => $user['id'],
                    'name'              => $user['name'],
                    'email'             => $user['email'],
                    'phone'             => $user['phone'],
                    'role'              => $user['role'],
                    'status'            => $user['status'],
                    'uuid'              => $user['uuid'],
                    'address'           => $user['address'],
                    'pincode'           => $user['pincode'],
                    'files'             => $mediaGallery

                ];

            }

            return $data;


        }
        catch (Exception $e){}

        return [];



    }

    public function getUsersByRole($role=null) {

        try{

            $users = User::join('customers as c','c.user_id', '=', 'users.id')
                ->where('users.role', $role)
                ->where('users.role', '<>', 'admin')
                ->where('users.status', 1)
                ->get();



            $data = [];

            foreach ($users as $user ){
                $mediaGallery = MediaGalleries::where('uuid', $user['uuid'])->get();


                $data[] = [
                    'id'                => $user['id'],
                    'name'              => $user['name'],
                    'email'             => $user['email'],
                    'phone'             => $user['phone'],
                    'role'              => $user['role'],
                    'status'            => $user['status'],
                    'uuid'              => $user['uuid'],
                    'address'           => $user['address'],
                    'pincode'           => $user['pincode'],
                    'files'             => $mediaGallery

                ];

            }

            return $data;


        }
        catch (Exception $e){}

        return [];

    }

    public function getUsersById($id) {
        return User::join('customers as c','c.user_id', '=', 'users.id')
            ->join('media_galleries as m','m.uuid','=','users.uuid')
            ->where('users.id', $id)
            ->where('users.status', 1)
            ->get();
    }

    public function getUserByPhone($phone, $role) {
        if ($phone) {
            return User::where('phone', $phone)->where('role', $role)->first();
        }
    }

    public function verifyOtp($otp, $phone) {

        if (User::where('phone', $phone)->where('otp', $otp)->first()) {
            return true;
        }
        else {
            return false;
        }
    }

}
