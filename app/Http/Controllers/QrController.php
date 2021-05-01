<?php

namespace App\Http\Controllers;

use App\QrGenerated;
use App\QrGenerates;
use App\Traits\FunctionalTraits;
use App\User;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use SimpleSoftwareIO\QrCode\QrCodeServiceProvider;

class QrController extends Controller
{
    use FunctionalTraits;

    public $successStatus = 200;

    public function generateQrCode(Request $request) {
        $input  = $request->all();


        //Custom Validation Rules Traits
        $requestInputFields = [
            'product_id',
            'user_id',
            'quantity'
        ];
        $alertValues        = [
            'Product',
            'User',
            'Quantity'
        ];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->successStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->successStatus);
        }

        if (!$product = $this->getProductById($input['product_id'])) {
            return [
                'status'    => false,
                'message'   => $this->invalid('Product'),
                'data'      => []
            ];
        }



        if ($input['quantity'] > $product[0]['quantity']) {
            return [
                'status'    => false,
                'message'   => 'Requested number of quantity is not available for this product.',
                'data'      => []
            ];
        }

        if (!$user = $this->getUsersById($input['user_id'])) {
            return [
                'status'    => false,
                'message'   => $this->invalid('User'),
                'data'      => []
            ];
        }

        $userData   = User::find($input['user_id']);
        $qrParam    = $product[0]['id'].'-'.$product[0]['quantity'].'-'.$product[0]['offer_price'].'-'.$input['quantity'];
        $directory  = '/assets/uploads/qr/'.$userData['uuid'];

        if (!file_exists(public_path().$directory)) {
            mkdir(public_path().$directory, 0777, true);
        }

        $filename = time().$product[0]['id'].'.png';

        QrCode::size(500) ->format('png') ->generate($qrParam, public_path().$directory.'/'.$filename);

        $qrFile = \Illuminate\Support\Facades\Request::root().$directory.'/'.$filename;



        if (!$qrData = QrGenerated::create(
            [
                'product_id'=>$input['product_id'],
                'user_id'=>$input['user_id'],
                'code'  => strtoupper($this->randomStringGenerator(6)),
                'quantity'  => $input['quantity'],
                'qr_path'   => $qrFile
            ])

        ) {
            return [
                'status'    => false,
                'message'   => $this->saveFail(),
                'data'      => []
            ];
        }

        /*$updatedQty = $this->updateProductQuantity($input['product_id']);
        if (!$updatedQty) {
            return [
                'status'    => 'error',
                'message'   => $this->updateFailed(),
                'data'      => []
            ];
        }*/



        $allQr =    $this->getAllQrByUserIdAndProductId($input['user_id'], $input['product_id']);


        return [
            'status'    => true,
            'message'   => 'Qr Generated Succesfully',
            'data'      => [
                'products'=>$this->getQrGeneratedByProductId($input['product_id']),
                'qr'    => $allQr

            ] ,
        ];



    }

    public function listQrForProductAndUser(Request $request) {
        $input  = $request->all();


        //Custom Validation Rules Traits
        $requestInputFields = [
            'product_id',
            'user_id',
        ];
        $alertValues        = [
            'Product',
            'User'
        ];

        if($this->notSetRule($input, $requestInputFields, $alertValues )['status'] == 'error'){
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->successStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->successStatus);
        }

        if (!$product = $this->getProductById($input['product_id'])) {
            return [
                'status'    => false,
                'message'   => $this->invalid('Product'),
                'data'      => []
            ];
        }
        if (!$user = $this->getUsersById($input['user_id'])) {
            return [
                'status'    => false,
                'message'   => $this->invalid('User'),
                'data'      => []
            ];
        }

        if (!$qr = $this->getAllQrByUserIdAndProductId($input['user_id'], $input['product_id'])) {
            return [
                'status'    => false,
                'message'   => $this->invalid('User'),
                'data'      => []
            ];
        }

        return [
            'status'    => true,
            'message'   => 'Qr Code List',
            'data'      => $qr
        ];






    }
}
