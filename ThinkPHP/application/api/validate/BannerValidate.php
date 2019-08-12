<?php

namespace app\api\validate;


class BannerValidate extends BaseValidate
{
    protected $rule = [
        'id' => 'require|integer|egt:1'
    ];
}