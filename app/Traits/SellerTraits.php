<?php

namespace App\Traits;

use App\Sellers;
use App\User;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Webpatser\Uuid\Uuid;

trait SellerTraits{

    public function getSellersToTable() {

        $data = $this->getAllSellers();

        $tableData  = [];

        $permissions = ['add'=>true, 'edit'=>'false', 'delete'=>true, 'view'=>'true'];

        foreach($data as $index=> $item){
            if (isset($item['status']) && $item['status'] == 1){
                $item['status'] = '<a href="" class="btn btn-success btn-sm status" data-value="1" data-id="'.$item['id'].'">Active</a>';
            }
            else{
                $item['status'] = '<a href="" class="btn btn-danger btn-sm status" data-value="0" data-id="'.$item['id'].'">Inactive</a>';
            }


            $action = '<a href="delete?id='.$item["id"].'"><i class="feather icon-trash-2"></i></a>';



            $tableData[]    = [
                'Sl.No'         => ['value' => ++$index, 'visible'=>true],
                'Seller Name'   => ['value'=>$item['name'], 'visible'=>true],
                'Brand Name'    => ['value'=>$item['brand_name'], 'visible'=>true],
                'Email'         => ['value'=>$item['email'], 'visible'=>true],
                'Status'        => ['value'=>$item['status'], 'visible'=>true],
                'Action'        => ['value'=>$action, 'visible'=>true],
            ];

        }

        $tableHeadCount = 3;

        return ['data'=>$tableData, 'tableHeadsCount'=>$tableHeadCount, 'permissions'=>$permissions];
    }

    public function getAllSellers() {
        return Sellers::join('users as u', 'u.id','=', 'sellers.user_id')
            ->select('sellers.*', 'u.name','u.email', 'u.status')
            ->get();
    }

    public function getSellerById($id) {
        return Sellers::join('users as u', 'u.id','=', 'sellers.user_id')
            ->select('sellers.*', 'u.name','u.email', 'u.status')
            ->where('sellers.id', $id)
            ->first();
    }

    public function changeSellerStatus($status, $seller) {

        if (!$seller) {
            return $this->invalid('Seller');
        }

        if (!$seller = $this->getSellerById($seller)) {
            return $this->invalid('Seller');
        }

        $status = ($status == 0)?1:0;

        $data = [
            'status' => $status
        ];



        if (User::where('id', $seller['user_id'])->where('role', 'seller')->update($data)) {
            return $response = [
                'code'   => 200,
                'status' => $status,
            ];

        }
        return $response = [
            'code'   => 401,
            'status' => $status,
        ];





    }

    public function updateSeller($data, $seller) {

        $seller = $this->getSellerById($seller);


    }
}
