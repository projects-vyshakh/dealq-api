<?php

namespace App\Traits;

use App\QrGenerated;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Webpatser\Uuid\Uuid;

trait QrTraits{
    public function getQrGeneratedByProductId($productId) {

        if ($productId) {
            return QrGenerated::where('product_id', $productId)
                ->join('products as p', 'p.id', '=', 'qr_generated.product_id')
                ->select('p.price', 'p.offer_price', 'p.quantity')
                ->first();
        }
    }
}
