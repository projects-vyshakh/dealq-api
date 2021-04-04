<?php

namespace App\Traits;


use App\MediaGalleries;
use App\ProductCategories;
use App\ProductDetails;
use App\ProductPrices;
use App\Products;
use Illuminate\Support\Str;
use PHPUnit\Framework\Exception;

trait ProductsTraits{

    public function getProductBySku($sku){
        try{
            if ($sku){
               return Products::where('sku', $sku)->first();
            }

            return '';
        }
        catch (Exception $e){}
    }

    public function getProductById($productId){



        try{

            $products = Products::where('id', $productId)->orderBy('sort_order', 'ASC')->get();

            $data = [];
            foreach ($products as $product ){
                $mediaGallery = MediaGalleries::where('uuid', $product['uuid'])->get();

                $data[] = [
                    'id'                => $product['id'],
                    'uuid'              => $product['uuid'],
                    'name'              => $product['name'],
                    'sku'               => $product['sku'],
                    'quantity'          => $product['quantity'],
                    'price'             => $product['price'],
                    'offer_price'       => $product['offer_price'],
                    'description'       => $product['description'],
                    'sort_order'        => $product['sort_order'],
                    'publish_status'    => $product['publish_status'],
                    'product_image'     => $mediaGallery

                ];

            }


            return $data;


        }
        catch (Exception $e){}

        return '';

    }

    public function getProducts($role=false){
        try{
            $products = ($role == 'seller')?Products::orderBy('sort_order', 'ASC')->where('publish_status', 1)->get():
                        Products::orderBy('sort_order', 'ASC')->get();

            $data = [];
            foreach ($products as $product ){
                $mediaGallery = MediaGalleries::where('uuid', $product['uuid'])->get();

                $data[] = [
                    'id'                => $product['id'],
                    'name'              => $product['name'],
                    'sku'               =>$product['sku'],
                    'quantity'          => $product['quantity'],
                    'price'             => $product['price'],
                    'offer_price'       => $product['offer_price'],
                    'description'       => $product['description'],
                    'sort_order'        => $product['sort_order'],
                    'publish_status'    => $product['publish_status'],
                    'product_image'     => $mediaGallery

                ];

            }

            return $data;


        }
        catch (Exception $e){}
    }

    public function deleteProductById($productId){
        try{
            $this->deleteProductImagesByProductId($productId);
            $product = Products::find($productId)->delete();

            if (!$product) {
                return false;
            }
            return true;

        }
        catch (Exception $e){}
        return false;

    }

    public function getProductImagesByProductId($productId){
        try{
            if ($productId){
                $productData = $this->getProductById($productId);
                $uuid        = $productData['uuid'];
                return MediaGalleries::where('uuid', $uuid)->get();
            }

            return '';
        }
        catch (Exception $e){}
    }

    public function deleteProductImagesByProductId($productId){
        try{
            if ($productId){
                $productData = $this->getProductById($productId);
               foreach ($productData as $product) {
                   MediaGalleries::where('uuid', $product['uuid'])->delete();
               }

            }

            return '';
        }
        catch (Exception $e){}
    }

    public function getLastSortOrder() {
        return Products::max('sort_order');
    }

    public function getNextSortOrder() {
        $sortOrder  = $this->getLastSortOrder();

        if (empty($sortOrder)) {
            $sortOrder = 1;

            return $sortOrder;
        }

        return $sortOrder+1;
    }

    public function getProductQuantity($productId) {
        if ($productId) {
            $products   = $this->getProductById($productId);
            if ($products) {
                foreach ($products as $product) {
                    return $product['quantity'];
                }
            }

        }
        return 0;
    }

    public function updateProductQuantity($productId) {

        if ($productId) {
            $quantity = $this->getProductQuantity($productId);

            if ($quantity > 0) {
                $quantity = $quantity - 1;
                if (!Products::where('id',$productId)->update(['quantity'=>$quantity])) {
                    return 'false';
                }
            }

            return 'true';


        }

    }


}
