<?php

namespace App\Http\Controllers;

use App\Sellers;
use App\Traits\FunctionalTraits;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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

    public function sellerLogin(Request $request) {
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) {

            if (Auth::user()->status == 1) {
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



                return response()->json($response, $this->successStatus);
            }

            else {
                    $response   =   [
                        'status'    =>  'error',
                        'message'   =>  $this->accountInactive(),
                    ];
                    return response()->json($response, $this->errorStatus);

            }


        }
        else {
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->failedLogin(),
            ];
            return response()->json($response, $this->errorStatus);
        }
    }

    public function index() {

        $pageTitle      = 'Sellers';
        $breadcrumbs    = 'Sellers';
        $browserTitle   = 'Sellers';
        $contentHeader  = 'Sellers';
        $tableData      = $this->getSellersToTable();

        //dd($tableData);

        $parameters = compact(
            [
                'pageTitle', 'breadcrumbs','browserTitle', 'contentHeader', 'tableData'
            ]
        );
        return view('sellers.index', $parameters);
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

        ];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if (!isset($input['id_proof']) && empty($input['id_proof'])) {
            $response   =   [
                'code'      => 200,
                'status'    => 'false',
                'message'   => $this->invalid('ID Proof'),
                'data'      => []
            ];
            return response()->json($response, $this->successStatus);
        }

        if (!isset($input['shop_licence']) && empty($input['shop_licence'])) {
            $response   =   [
                'code'      => 200,
                'status'    => 'false',
                'message'   => $this->invalid('Shop Licence'),
                'data'      => []
            ];
            return response()->json($response, $this->successStatus);
        }





        //Checking Unique Columns
        /*$fieldNames     = ['email'];
        $fieldValues    = [$input['email']];
        $models         = 'App\User';
        if($this->checkRecordExist('App\User', $fieldNames, $fieldValues)['status'] == 'error'){
            return response()->json($this->checkRecordExist('App\User', $fieldNames, $fieldValues), $this->errorStatus);
        }*/

        if (!$user = User::where('phone', $input['phone'])->where('role', $input['role'])->first()) {
            $response   =   [
                'code'      => 200,
                'status'    => 'error',
                'message'   => 'No account exist with '.$input['phone'].' as '. $input['role'],
                'data'      => []
            ];
            return response()->json($response, $this->successStatus);
        }

        $dataArray = [
            'name'      => $input['name'],
            'email'     => $input['email'],
            'status'    => '1',
            'uuid'      => Uuid::generate()->string,
        ];

        if (!User::where('phone', $input['phone'])->where('role', $input['role'])->update($dataArray)) {
            $response   =   [
                'code'      => 200,
                'status'    => 'false',
                'message'   => $this->somethingWrong('when updating Seller Data'),
                'data'      => []
            ];
            return response()->json($response, $this->successStatus);
        }


        $data = User::where('phone', $input['phone'])->where('role', $input['role'])->first();


        /*if(!$data = User::create([
            'name'      => $input['name'],
            'email'     => $input['email'],
            'password'  => Hash::make($request['password']),
            'phone'     => $input['mobile'],
            'role'      => 'seller',
            'uuid'      => Uuid::generate()->string
        ])){

            $response   =   [
                'status'    => 'error',
                'message'   => $this->somethingWrong('when creating User'),
                'data'      => []
            ];
            return response()->json($response, $this->errorStatus);
        }*/


        $sellerData = [
            'seller_categories' => $input['seller_category'],
            'brand_name'        => $input['brand_name'],
            'address'           => $input['address'],
            'pincode'           => $input['pincode'],
            'location'          => $input['location'],
            'fssai_license'     => $input['fssai_license'],
            'reference_code'    => strtoupper($input['reference_code']),
            'user_id'           => $data->id,
            'promocode'         => strtoupper($this->randomStringGenerator(6)),
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

        //Getting registration status for seller
        //$registrationStatus = $this->getSellerRegistrationStatus($data['id']);

        $sellers = User::join('sellers as s','s.user_id','=','users.id')->get();

        $request['uuid']    = $data->uuid;
        $brandImageUpload = $this->addBrandImages($request);

        if ($brandImageUpload['status'] == 'error') {
            //Sellers::where('user_id', $data->id)->delete();
            //User::find($data->id)->delete();
            return $brandImageUpload;
        }

        $idProof = $this->addIdProof($request);
        if ($idProof['status'] == 'error') {
           // Sellers::where('user_id', $data->id)->delete();
           // User::find($data->id)->delete();
            return $idProof;
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
        $uploadData = $this->upload('shop_image', 'images',  $request, 'multiple');

        if ($uploadData['status'] == 'error') {
            return $uploadData;
        }

    }
    public function addLicence($request) {

        $bucketPath = 'shop/'.$request['uuid'];
        $request['bucket_path'] = $bucketPath;
        $uploadData = $this->upload('shop_licence', 'images',  $request, 'single');

        if ($uploadData['status'] == 'error') {
            return $uploadData;
        }

    }

    public function addIdProof($request) {

        $bucketPath = 'shop/'.$request['uuid'];
        $request['bucket_path'] = $bucketPath;
        $uploadData = $this->upload('id_proof', 'images',  $request, 'single');

        if ($uploadData['status'] == 'error') {
            return $uploadData;
        }

    }

    public function handleSellerStatus(Request $request) {
        $seller = $this->changeSellerStatus($request['status'], $request['seller']);

        return json_encode($seller);
    }
}
