<?php

namespace App\Traits;

use App\MediaGalleries;
use App\User;
use Illuminate\Support\Str;

trait MediaGalleryTraits{

    public function getMediaGalleriesByUuid($uuid) {
        if ($uuid) {
            $mediaData = MediaGalleries::where('uuid', $uuid)->get();
            return [
                'status'    =>  'success',
                'message'   =>  'Media Gallery Data',
                'data'      => $mediaData
            ];

        }
    }

    public function removeMediaGalleriesByUuid($uuid) {
        if ($uuid) {

            MediaGalleries::where('uuid', $uuid)->delete();
            return [
                'status'    =>  'success',
                'message'   => 'Media removed',
                'data'      => []
            ];

        }
    }

}
