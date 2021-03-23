<?php

namespace App\Traits;

use App\MediaGalleries;
use App\MediaSettings;
use App\MediaType;
use App\User;

trait FileUploadTraits{

    use MediaGalleryTraits;

    public function upload($field, $mediaType, $request){

        $mediaSettings  = $this->getMediaSettings($mediaType);

        if ($mediaSettings['status'] == 'error') {
            return $mediaSettings;
        }

        $basePath           = $mediaSettings['data']['base_path'];
        $allowedExtensions  = json_decode($mediaSettings['data']['allowed_extensions']);
        $path               = $basePath.$mediaType.'/'.$request['bucket_path']."/";
        $data               = [];

        if ($request->hasFile($field)) {
            $files  = $request->file($field);
            foreach ($files as $index=>$file ) {
                if(!in_array($file->getClientOriginalExtension(), $allowedExtensions)){
                    $this->removeMediaGalleriesByUuid($request['uuid']);
                    return [
                        'status'    =>  'error',
                        'message'   =>  $this->invalidFileFormat(),
                    ];
                }

                $filename = time().$index. "." . $file->getClientOriginalExtension();
                if(!$file->move($path, $filename)){
                    $this->removeMediaGalleriesByUuid($request['uuid']);
                    return [
                        'status'    =>  'error',
                        'message'   =>  $this->errorFileUpload(),
                    ];
                }

                if(!$mediaGallery = MediaGalleries::create([
                    'media_type'    => $mediaType,
                    'filename'  => $filename, //$file->getClientOriginalName(),
                    'path'      => $path,
                    'uuid'      => $request['uuid']

                    ])){

                    $this->removeMediaGalleriesByUuid($request['uuid']);

                    return [
                        'status'    =>  'error',
                        'message'   =>  $this->somethingWrong('when saving the media gallery.'),
                    ];
                }
            }
        }

    }

    public function getMediaSettings($mediaType) {

        if ($mediaType) {
            if(!$mediaSettings  = MediaSettings::where('media_type', $mediaType)->first()){
                $response   =   [
                    'status'    =>  'error',
                    'message'   =>  $this->notExist("Media Settings"),
                ];
                return $response;
            }

            $response   =   [
                'status'    => 'success',
                'message'   => '',
                'data'      => $mediaSettings
            ];
            return $response;
        }

    }



}
