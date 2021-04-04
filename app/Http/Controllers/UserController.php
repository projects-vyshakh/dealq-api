<?php

namespace App\Http\Controllers;

use App\Customers;
use App\MediaGalleries;
use App\MediaGallery;
use App\Traits\FunctionalTraits;
use App\User;
use App\UserEntities;

use Illuminate\Http\Request;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Laravel\Passport\HasApiTokens;
use Laravel\Passport\Client as OClient;
use Webpatser\Uuid\Uuid;


class UserController extends Controller
{
    use FunctionalTraits;
    use HasApiTokens;

    public $successStatus = 200;
    public $errorStatus   = 401;


    public function login(Request $request) {
        //dd($request);
        //dd(Hash::make('~if(v_pro)'));
        //echo Uuid::generate()->string;

        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) {
            $token  =   Auth::user()->createToken('DealQ');

            $response   =   [
                'status'    =>  'success',
                'message'   =>  $this->successLogin(),
                'data'      =>  [
                    'userType'  =>  Auth::user()->role,
                    //'authToken' =>  $request->bearerToken()
                    'authToken' =>  $token
                ],
            ];

            Session::put('api-role', Auth::user()->role);

            return response()->json($response, $this->successStatus);

        }
        else {
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->failedLogin(),
            ];
            return response()->json($response, $this->errorStatus);
        }
    }

    public function listAllUsers(Request $request) {
        $input      = $request->all();


        //Custom Validation Rules Traits
        $requestInputFields = ['role'];
        $alertValues        = ['Role'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if (!$users = $this->getUsersByRole($input['role'])) {
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->noRecordAvailable(),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }



        $response   =   [
            'status'    => 'success',
            'message'   => 'User List',
            'data'      => $users
        ];
        return response()->json($response, $this->successStatus);

    }

    public function listUser(Request $request){

        $input      = $request->all();


        //Custom Validation Rules Traits
        $requestInputFields = ['user_id'];
        $alertValues        = ['User'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if (!$users = $this->getUsersByRoleAndId('customer',$input['user_id'])) {
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->noRecordAvailable(),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }



        $response   =   [
            'status'    => 'success',
            'message'   => 'User List',
            'data'      => $users
        ];
        return response()->json($response, $this->successStatus);
    }

    public function createUser(Request $request){
        $input      = $request->all();
        //$password   = $this->randomStringGenerator(8);

        //Custom Validation Rules Traits
        $requestInputFields = ['name', 'email', 'phone', 'password', 'pincode', 'location'];
        $alertValues        = ['Name', 'Email', 'Phone', 'Password', 'Pincode', 'Location'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        //Checking Unique Columns
        $fieldNames     = ['email'];
        $fieldValues    = [$input['email']];
        $models         = 'App\User';
        if($this->checkRecordExist('App\User', $fieldNames, $fieldValues)['status'] == 'error'){
            return response()->json($this->checkRecordExist('App\User', $fieldNames, $fieldValues), $this->errorStatus);
        }

        if(!$data = User::create([
            'name'      => $input['name'],
            'email'     => $input['email'],
            'password'  => Hash::make($request['password']),
            'phone'     => $input['phone'],
            'role'      => 'customer',
            'status'    => 1,
            'uuid'      => Uuid::generate()->string,
        ])){

            $response   =   [
                'status'    => 'error',
                'message'   => $this->somethingWrong('when creating Customers Data'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }

        $request['user_id'] = $data->id;
        $request['uuid']    = $data->uuid;

        if (!$customers = Customers::create([
            'user_id'           => $request['user_id'],
            'address'           => $request['address'],
            'pincode'           => $request['pincode'],
            'referral_code'     => $request['referral_code'],
            'location'          => $request['location']
        ])) {

            User::where('id', $request['user_id'])->delete();

            $response   =   [
                'status'    => 'error',
                'message'   => $this->somethingWrong('when creating Customers Data'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);

        }


        //Profile image upload
        $imageUpload    = $this->addProfileImage($request);
        $documentUpload = $this->documentUploads($request);

        if ($imageUpload['status'] == 'error') {

            Customers::where('user_id', $request['user_id'])->delete();
            User::where('id', $request['user_id'])->delete();
            return $imageUpload;

        }
        if ($documentUpload['status'] == 'error') {

            Customers::where('user_id', $request['user_id'])->delete();
            User::where('id', $request['user_id'])->delete();
            return $documentUpload;

        }

        $user = $this->getUsersByRole('customer');

        $response   =   [
            'status'    =>  'success',
            'message'   =>  $this->saveSuccess(),
            'data'      =>  $user
        ];
        return response()->json($response, $this->successStatus);

    }

    public function updateUser(Request  $request){

        $input  = $request->all();

        //Custom Validation Rules Traits
        $requestInputFields = ['user_id','name', 'email', 'phone', 'pincode', 'location'];
        $alertValues        = ['user_id','Name', 'Email', 'Phone', 'Pincode', 'Location'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if(!$user = User::find($input['user_id'])){
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->invalid('User'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }

        if($input['email']!=$user['email']){
            //Checking Unique Columns
            $fieldNames     = ['email'];
            $fieldValues    = [$input['email']];
            $models         = 'App\User';
            if($this->checkRecordExist('App\User', $fieldNames, $fieldValues)['status'] == 'error'){
                return response()->json($this->checkRecordExist('App\User', $fieldNames, $fieldValues), $this->errorStatus);
            }
        }



        //File upload
        $request['uuid']    = $user->uuid;
        $request['user_id'] = $user->id;



        if ($request->hasFile('profile_image')) {

            if(!$mediaGallery = MediaGalleries::where('media_type', 'images')->where('uuid', $request['uuid'])->get()){
                $result    = $this->addProfileImage($request);
            }
            else{
                MediaGalleries::where('uuid', $user->uuid)->where('media_type', 'images')->delete();
                $result =  $this->addProfileImage($request);
            }

            //dd($mediaGallery);

            if($result['status'] == 'error'){
                $response   =   [
                    'status'    =>  'error',
                    'message'   =>  $result['message'],
                    'data'      => []
                ];
                return $response;
            }
        }

        if($request->hasFile('documents')){
            if(!$mediaGallery = MediaGalleries::where('media_type', 'documents')->where('uuid', $user['uuid'])->get()){
                $result = $documentUpload = $this->documentUploads($request);
            }
            else{
                if(MediaGalleries::where('uuid', $user->uuid)->where('media_type', 'documents')->delete()){
                    $result = $documentUpload = $this->documentUploads($request);
                }
            }


            if($result['status'] == 'error'){
                $response   =   [
                    'status'    =>  'error',
                    'message'   =>  $result['message'],
                    'data'      => []
                ];
                return $response;
            }
        }



        $dataArray  =   [
            'name' => $input['name'],
            'email'=>$input['email'],
            'phone'=>$input['phone']

        ];

        if(!$user->update($dataArray)){
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->updateFailed(),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }

        $customerArray = [
            'address'           => $input['address'],
            'pincode'           => $input['pincode'],
            'referral_code'     => $input['referral_code'],
            'location'          => $input['location'],
        ];

        if(!$customer = Customers::where('user_id', $user->id)->update($customerArray)){
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->updateFailed(),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }


        $userData = $this->getUsersByRoleAndId('customer', $user->id);
        $response   =   [
            'status'    =>  'success',
            'message'   =>  $this->saveSuccess(),
            'data'      => $userData
        ];

        return response()->json($response, $this->successStatus);

    }

    public function deleteUser(Request $request){
        $input  = $request->all();

        //Custom Validation Rules Traits
        $requestInputFields = ['user_id'];
        $alertValues        = ['User'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if(!$user = User::find($input['user_id'])){
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->invalid('User'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }

        //Delete Media
        $mediaGallery   = MediaGalleries::where('uuid', $user->uuid)->whereIn('media_type',['images','documents'])->delete();

        Customers::where('user_id', $user->id)->delete();


        //User Delete
        if(!User::where('id', $input['user_id'])->delete()){
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->deleteFail('User'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }

        $response   =   [
            'status'    =>  'success',
            'message'   =>  $this->deleteSuccess('User'),
            'data'      => []
        ];
        return response()->json($response, $this->successStatus);
    }

    public function addProfileImage($request) {

        $bucketPath = 'customers/'.$request['uuid'];

        $request['bucket_path'] = $bucketPath;
        $uploadData = $this->upload('profile_image', 'images',  $request);

        if ($uploadData['status'] == 'error') {
            return $uploadData;
        }

    }

    public function documentUploads($request) {

        $bucketPath = 'customers/'.$request['uuid'];
        $request['bucket_path'] = $bucketPath;
        $uploadData = $this->upload('documents', 'documents',  $request);

        if ($uploadData['status'] == 'error') {
            return $uploadData;
        }

    }

    public function logout(Request $request) {
        $this->token()->revoke();
        //$request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

}
