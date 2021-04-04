<?php

namespace App\Http\Controllers;

use App\MediaGalleries;
use App\ProductCategories;
use App\ProductDetails;
use App\ProductPrices;
use App\Products;
use App\Traits\FunctionalTraits;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;


class ProductController extends Controller
{

    use FunctionalTraits;

    public $successStatus = 200;
    public $errorStatus   = 401;

    public function createProduct(Request $request){
        $input          = $request->all();
        $returnData     = [];

        //Custom Validation Rules Traits
        $requestInputFields = [
            'name',
            'sku',
            'description',
            'quantity',
            'price',
            'offer_price',
            'category',

        ];
        $alertValues        = [
            'Product Name',
            'Sku',
            'Description',
            'Quantity',
            'Price',
            'Offer Price',
            'Category'
        ];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if ($this->getProductBySku($request['sku'])){
            $response   =   [
                'status'    => 'error',
                'message'   => $this->alreadyExist('Product'),
            ];
            return $response;
        }

        $nextSortOrder  = $this->getNextSortOrder();

        //dd($nextSortOrder);

        if (!$products = Products::create([
            'name'              => $input['name'],
            'sku'               => $input['sku'],
            'description'       => $input['description'],
            'quantity'          => $input['quantity'],
            'price'             => $input['price'],
            'offer_price'       => $input['offer_price'],
            'category'          => $input['category'],
            'uuid'              => $this->UuidGenerator(),
            'is_active'         => $input['status'],
            'sort_order'        => $nextSortOrder,
            'publish_status'    => $input['publish_status']

        ])) {


            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->saveFail(),
                'data'      =>  ''
            ];
            return response()->json($response, $this->successStatus);

        }

        $request['product_id']  = $products->id;
        $request['sku']         = $products->sku;
        $request['uuid']        = $products->uuid;

        $this->addProductMediaGalleries($request);

        $response   =   [
            'status'    =>  'success',
            'message'   =>  $this->saveSuccess(),
            'data'      =>  $this->getProducts()
        ];
        return response()->json($response, $this->successStatus);

    }

    public function updateProduct(Request $request){
        $input          = $request->all();
        $returnData     = [];


        //Custom Validation Rules Traits
        $requestInputFields = [
            'product_id',
            'name',
            'description',
            'quantity',
            'price',
            'offer_price',
            'category',
            'status'
        ];
        $alertValues        = [
            'Product',
            'Product Name',
            'Description',
            'Quantity',
            'Price',
            'Offer Price',
            'Category',
            'Status'
        ];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if (!$this->getProductById($request['product_id'])) {
            return    [
                'status'    => 'error',
                'message'   => $this->invalid('Product'),
                'data'      => []
            ];
        }

        $updateArray = [
            'name'          => $input['name'],
            'sku'           => $input['sku'],
            'description'   => $input['description'],
            'quantity'      => $input['quantity'],
            'price'         => $input['price'],
            'offer_price'   => $input['offer_price'],
            'category'      => $input['category'],
            'is_active'     => $input['status'],
            'sort_order'    => $input['sort_order'],
            'publish_status'=> $input['publish_status']
        ];

        if (!Products::where('id', $request['product_id'])->update($updateArray)) {
            $response   =   [
                'status'    =>  'error',
                'message'   =>  $this->updateFailed(),
                'data'      =>  ''
            ];
            return response()->json($response, $this->errorStatus);
        }



        $products = $this->getProductById($request['product_id']);

        if ($products) {
            foreach ($products as $product) {

                $request['product_id']  = $product['id'];
                $request['sku']         = $product['sku'];
                $request['uuid']        = $product['uuid'];
            }

            if ($request->hasFile('product_image')) {
                MediaGalleries::where('uuid', $request['uuid'])->delete();
                $this->addProductMediaGalleries($request);
            }

            $response   =   [
                'status'    =>  'success',
                'message'   =>  $this->updateSuccess(),
                'data'      =>  $products
            ];
            return response()->json($response, $this->successStatus);
        }

    }

    public function addProductMediaGalleries($request) {

        $bucketPath = 'catalog/products/'.$request['product_id'];
        $request['bucket_path'] = $bucketPath;
        $uploadData = $this->upload('product_image', 'images',  $request, 'multiple');

        if ($uploadData['status'] == 'error') {
            return $uploadData;
        }

    }

    public function listAllProducts(Request $request) {

        if ($this->getUserByAccessToken()['status'] == 'error') {
            return [
                'status'    => 'error',
                'message'   => 'Invalid Access Token',
                'data'      => []
            ];
        }


        if (isset($this->getUserByAccessToken()['data']['role'])) {
            $userRole = $this->getUserByAccessToken()['data']['role'];
            $products   = $this->getProducts($userRole);

            return [
                'status'    => 'success',
                'message'   => 'Product List',
                'data'      => $products
            ];
        }




    }

    public function listProduct(Request $request){

        $input          = $request->all();

        //Custom Validation Rules Traits
        $requestInputFields = [ 'product_id'];
        $alertValues        = ['Product'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        $product = $this->getProductById($request['product_id']);

        if (!$product) {
            return [
                'status'    => 'error',
                'message'   => 'Empty Product List',
                'data'      => []
            ];

            return response()->json($response);
        }

        $response   =   [
            'status'    => 'success',
            'message'   => 'Product List',
            'data'      => $product
        ];


        return response()->json($response);
    }

    public function deleteProduct(Request $request){

        $input          = $request->all();

        //Custom Validation Rules Traits
        $requestInputFields = [ 'product_id'];
        $alertValues        = ['Product'];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if (!$this->getProductById($request['product_id'])) {
            return [
                'status'    => 'error',
                'message'   => $this->invalid('Product'),
                'data'      => []
            ];

            return response()->json($response);
        }

        if ($this->deleteProductById($request['product_id'])) {
            $products   = $this->getProducts();
            $response   =   [
                'status'    => 'success',
                'message'   => $this->deleteSuccess('Product'),
                'data'      => $products
            ];

            return response()->json($response);

        }
        else {
            return [
                'status'    => 'error',
                'message'   => $this->deleteFail('Product'),
                'data'      => []
            ];

            return response()->json($response);
        }

    }

    public function updatePublishStatus(Request $request) {
        $input = $request->all();

        //Custom Validation Rules Traits
        $requestInputFields = [
            'product_id',
            'publish_status'

        ];
        $alertValues        = [
            'Product',
            'Publish Status'
        ];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }


        $productData = $this->getProductById($input['product_id']);

        if ($productData) {
            if (!Products::find($input['product_id'])->update(['publish_status'=>$input['publish_status']]) ) {
                return    [
                    'status'    => 'error',
                    'message'   => $this->updateFailed(),
                    'data'      => []
                ];
            }

            return    [
                'status'    => 'success',
                'message'   => $this->updateSuccess(),
                'data'      => $this->getProductById($input['product_id'])
            ];
        }

    }

}
