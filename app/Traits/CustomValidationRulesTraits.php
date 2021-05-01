<?php

namespace App\Traits;

use App\User;
use App\Services;

trait CustomValidationRulesTraits{

    public function notSetRule($request, $requestInputFields, $alertValues){

        if(!empty($requestInputFields)){
            foreach($requestInputFields as $index=> $requestInputs){
                if(!isset($request[$requestInputs])){
                    $response   =   [
                        'code'      => 200,
                        'status'    =>  'error',
                        'message'   =>  $this->invalid($alertValues[$index]),
                        'data'      => []
                    ];
                    return $response;
                }
            }

        }
    }

    public function emptyRules($request, $requestInputFields, $alertValues){
        if(!empty($requestInputFields)){
            foreach($requestInputFields as $index=> $requestInputs){
                if(empty($request[$requestInputs])){
                    $response   =   [
                        'code'      => 200,
                        'status'    =>  error,
                        'message'   =>  $this->emptyFieldsAlert(),
                        'data'      => []
                    ];
                    return $response;
                }
            }

        }
    }

    public function alreadyExistRules($request, $requestInputFields, $alertValues){
        if(!empty($requestInputFields)){
            foreach($requestInputFields as $index=> $requestInputs){
                if(empty($request[$requestInputs])){
                    $response   =   [
                        'status'    =>  'error',
                        'message'   =>  $this->alreadyExist($requestInputs),
                    ];
                    return $response;
                }
            }

        }
    }
}
