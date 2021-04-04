<?php

namespace App\Traits;


use App\Categories;
use Illuminate\Support\Str;


trait CategoryTraits{

    public function getCategoriesToTable(){
        $data = Categories::all();

        $tableData  = [];

        $permissions = ['add'=>true, 'edit'=>'false', 'delete'=>true, 'view'=>'true'];

        foreach($data as $index=> $item){
            if (isset($item['status']) && $item['status'] == 1){
                $item['status'] = '<a href="" class="btn btn-success btn-sm">Enabled</a>';
            }
            else{
                $item['status'] = '<a href="" class="btn btn-success btn-sm">Disabled</a>';
            }


            $action = '<a href="delete?id='.$item["id"].'"><i class="feather icon-trash-2"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="" class="send-newsletter" data-id="'.$item["id"].'"  data-name="'.$item["name"].'" data-email="'.$item["email"].'"><i class="feather icon-mail"></i></a>';



            $tableData[]    = [
                'Sl.No'         => ['value' => ++$index, 'visible'=>true],
                'Name'          => ['value'=>$item['category_name'], 'visible'=>true],
                'Action'        => ['value'=>$action, 'visible'=>true],
            ];

        }

        $tableHeadCount = 3;

        return ['data'=>$tableData, 'tableHeadsCount'=>$tableHeadCount, 'permissions'=>$permissions];
    }

}
