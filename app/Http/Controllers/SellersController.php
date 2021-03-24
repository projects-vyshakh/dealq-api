<?php

namespace App\Http\Controllers;

use App\Sellers;
use App\Traits\FunctionalTraits;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Webpatser\Uuid\Uuid;

class SellersController extends Controller
{

    use FunctionalTraits;

    public $successStatus = 200;
    public $errorStatus   = 401;


    public function __construct(){
        //$this->middleware(['auth']);
    }
    public function createSeller(Request $request) {

        $input          = $request->all();

        //Custom Validation Rules Traits
        $requestInputFields = [
            'seller_category',
            'name',
            'brand_name',
            'mobile',
            'email',
            'location',
            'fssai_license',
            'pincode',
            'password',
        ];
        $alertValues        = [
            'Category',
            'Seller Name',
            'Brand Name',
            'Mobile',
            'Email',
            'Location',
            'FSSAI License',
            'Pincode',
            'Password'
        ];

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
            'phone'     => $input['mobile'],
            'role'      => 'seller',
            'status'    => 0,
            'uuid'      => Uuid::generate()->string,
        ])){

            $response   =   [
                'status'    => 'error',
                'message'   => $this->somethingWrong('when creating User'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }


        $sellerData = [
            'seller_categories' => $input['seller_category'],
            'brand_name'        => $input['brand_name'],
            'address'           => $input['address'],
            'pincode'           => $input['pincode'],
            'location'          => $input['location'],
            'fssai_license'     => $input['fssai_license'],
            'user_id'           => $data->id,
            'promocode'         => strtoupper(Str::random(6)),
            'gst'               => $input['gst'],

        ];


        if (!$seller = Sellers::create($sellerData)) {
            $response   =   [
                'status'    => 'error',
                'message'   => $this->somethingWrong('when creating Seller'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);

        }

        $sellers = User::join('sellers as s','s.user_id','=','users.id')->get();

        $request['uuid']    = $data->uuid;
        $brandImageUpload = $this->addBrandImages($request);

        if ($brandImageUpload['status'] == 'error') {
            Sellers::where('user_id', $data->id)->delete();
            User::find($data->id)->delete();
            return $brandImageUpload;
        }

        $response   =   [
            'status'    =>  'success',
            'message'   =>  $this->saveSuccess(),
            'data'      =>  $sellers
        ];
        return response()->json($response, $this->successStatus);


    }

    public function addBrandImages($request) {

        $bucketPath = 'shop/'.$request['uuid'];
        $request['bucket_path'] = $bucketPath;
        $uploadData = $this->upload('shop_image', 'images',  $request);

        if ($uploadData['status'] == 'error') {
            return $uploadData;
        }

    }
}
