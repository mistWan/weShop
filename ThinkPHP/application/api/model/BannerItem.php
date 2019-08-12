<?php


namespace app\api\model;


class BannerItem extends Base
{
    protected $hidden = ['image_id', 'key_word', 'banner_id', 'created_at', 'updated_at'];
    public function image()
    {
        return $this->belongsTo('image');
    }
}