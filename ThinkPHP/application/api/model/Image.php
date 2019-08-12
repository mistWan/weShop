<?php


namespace app\api\model;


class Image extends Base
{
    protected $hidden = ['from', 'id', 'created_at', 'updated_at'];

    public function getUrlAttr($value, $data)
    {
        return $this->setImagePath($value, $data);
    }
    
}