<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MediaSettings extends Model
{
    protected $fillable = [
        'settings_name','media_type','allowed_extension','base_path', 'created_at','updated_at'
    ];
}
