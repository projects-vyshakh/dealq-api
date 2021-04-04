<?php

namespace App\Traits;

use App\MediaGalleries;
use App\MediaSettings;
use App\MediaType;
use App\User;

trait FileUploadTraits{

    use MediaGalleryTraits;

    public function upload($field, $mediaType, $request, $condition='single'){

        $mediaSettings  = $this->getMediaSettings($mediaType);

        if ($mediaSettings['status'] == 'error') {
            return $mediaSettings;
        }

        $basePath           = $mediaSettings['data']['base_path'];
        $allowedExtensions  = json_decode($mediaSettings['data']['allowed_extensions']);
        $path               = $basePath.$request['bucket_path']."/";
        $data               = [];

        if ($request->hasFile($field)) {
            $files  = $request->file($field);

            if ($condition == 'multiple') {
                return $this->uploadMultipleFiles($files, $request, $allowedExtensions, $path, $mediaType);
            }

            return $this->uploadSingleFile($files, $request, $allowedExtensions, $path, $mediaType);

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

    public function uploadMultipleFiles($files, $request, $allowedExtensions, $path, $mediaType) {

        if ($files) {
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

    public function uploadSingleFile($files, $request, $allowedExtensions, $path, $mediaType)
    {
        if ($files){
            if (!in_array($files -> getClientOriginalExtension(), $allowedExtensions)){

                $this -> removeMediaGalleriesByUuid($request['uuid']);
                return ['status' => 'error', 'message' => $this -> invalidFileFormat(),];
            }

            $filename = time() . "." . $files -> getClientOriginalExtension();

            if (!$files -> move($path, $filename)){
                $this -> removeMediaGalleriesByUuid($request['uuid']);
                return ['status' => 'error', 'message' => $this -> errorFileUpload(),];
            }

            if (!$mediaGallery = MediaGalleries ::create(['media_type' => $mediaType, 'filename' => $filename, //$file->getClientOriginalName(),
                'path' => $path, 'uuid' => $request['uuid']

            ])){

                $this -> removeMediaGalleriesByUuid($request['uuid']);

                return ['status' => 'error', 'message' => $this -> somethingWrong('when saving the media gallery.'),];
            }
        }

    }



}
