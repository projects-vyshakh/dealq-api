<?php

namespace App\Http\Controllers;

use App\QrGenerated;
use App\QrGenerates;
use App\Traits\FunctionalTraits;
use Illuminate\Http\Request;

class QrController extends Controller
{
    use FunctionalTraits;

    public function generateQrCode(Request $request) {
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
            return response()->json($this->notSetRule($input, $requestInputFields, $alertValues ), $this->errorStatus);
        }
        if($this->emptyRules($input, $requestInputFields, $alertValues)['status'] == 'error'){
            return response()->json($this->emptyRules($input, $requestInputFields, $alertValues), $this->errorStatus);
        }

        if (!$product = $this->getProductById($input['product_id'])) {
            return [
                'status'    => 'error',
                'message'   => $this->invalid('Product'),
                'data'      => []
            ];
        }

        if (!$user = $this->getUsersById($input['user_id'])) {
            return [
                'status'    => 'error',
                'message'   => $this->invalid('User'),
                'data'      => []
            ];
        }

        if (!$qrData = QrGenerated::create(
            [
                'product_id'=>$input['product_id'],
                'user_id'=>$input['user_id'],
                'code'  => strtoupper($this->randomStringGenerator(6))
            ])

        ) {
            return [
                'status'    => 'error',
                'message'   => $this->saveFail(),
                'data'      => []
            ];
        }

        $updatedQty = $this->updateProductQuantity($input['product_id']);
        if (!$updatedQty) {
            return [
                'status'    => 'error',
                'message'   => $this->updateFailed(),
                'data'      => []
            ];
        }

        return [
            'status'    => 'success',
            'message'   => 'Qr Generated Succesfully',
            'data'      => $this->getQrGeneratedByProductId($input['product_id']),
        ];



    }
}
