<?php

namespace App\Traits;

use App\User;
use App\Services;

trait FunctionalTraits{
    use AlertMessageTraits;
    use CustomValidationRulesTraits;
    use FileUploadTraits;
    use EmailTraits;
    use UtilityTraits;
    use ProductsTraits;
    use CategoryTraits;
    use UserTraits;
    use QrTraits;
    use SellerTraits;
    use SubscriptionTraits;

    public function checkRecordExist($models, $fieldNames, $fieldValues){
        if(!empty($models) && !empty($fieldNames) && !empty($fieldValues)){
            foreach($fieldNames as $index=> $fieldName){
                if($models::where($fieldName, $fieldValues[$index])->count()){
                    $response   =   [
                        'status'    =>  'false',
                        'message'   =>  $this->alreadyExist($fieldValues[$index]),
                        'data'      => []
                    ];
                    return $response;
                }
            }
        }

    }

    public function getDataByPrimaryKey($model, $value){
        $data   = $model::find($value);
        return $data;

    }

}
