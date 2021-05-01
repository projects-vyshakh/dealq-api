<?php

namespace App\Traits;

use App\Customers;
use App\MediaGalleries;
use App\Sellers;
use App\Subscriptions;
use App\User;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request;
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

    public function verifyOtp($otp, $phone, $role) {

        if (User::where('phone', $phone)->where('role', $role)->where('otp', $otp)->first()) {
            return true;
        }
        else {
            return false;
        }
    }

    public function getUserRegistration($userId, $role) {

        if ($userId && $role) {
            switch ($role) {
                case 'seller':
                    if (Sellers::where('user_id', $userId)->first()) {
                        return response()->json( [
                            'code'  => 200,'status' => true, 'message'  =>'Registration Completed', 'data'  =>  []
                        ]);
                    }
                    break;

                case 'customer':
                    if (Customers::where('user_id', $userId)->first()) {
                        return response()->json( [
                            'code'  => 200,'status' => true, 'message'  =>'Registration Completed', 'data'  =>  []
                        ]);
                    }
                    break;

                default:
                    return response()->json( [
                        'code'  => 200,'status' => false, 'message'  =>'Registration Incomplete', 'data'  =>  []
                    ]);
            }

            return response()->json( [
                'code'  => 200,'status' => false, 'message'  =>'Registration Incomplete', 'data'  =>  []
            ]);
        }

    }

    public function getUsersByPhoneAndRole($phone, $role) {
        if ($phone && $role) {
            switch ($role){
                case 'seller':
                    $userData  = User::where('users.phone', $phone) ->where('users.role', $role) ->first();

                    if ($userData) {

                        $sellerData = Sellers::where('user_id', $userData['id'])->first();
                        $userData['details']    = $sellerData;

                        $subscriptionData = Subscriptions::where('seller_id', $userData['id'])->where('subscription_status','active')->first();
                        $userData['subscription'] = $subscriptionData;

                        $mediaGallery   = MediaGalleries::where('uuid', $userData['uuid'])->get();

                        if ($mediaGallery) {
                            $galleryData = [];
                            foreach ($mediaGallery as $index=> $media) {
                                $index = $index + 1;
                                $basePath   = Request ::root().'/'.$media['path'].$media['filename'];
                                $galleryData['image'.$index]   = ['media_type'=>$media['media_type'], 'media'=>$basePath];
                            }
                            $userData['media_count']  = count($mediaGallery);
                            $userData['media_files']  = $galleryData;
                        }

                    }

                    return $userData;

                    break;

                case 'customer':
                    $userData  = User::where('users.phone', $phone) ->where('users.role', $role) ->first();
                    if ($userData) {

                        $sellerData = Customers::where('user_id', $userData['id'])->first();
                        $userData['details']    = $sellerData;

                    }

                    return $userData;

                    break;
            }


        }
    }

}
