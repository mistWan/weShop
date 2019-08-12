<?php

namespace app\api\validate;


use app\exception\ParameterException;
use think\Validate;

class BaseValidate extends Validate
{
    public function invalidParameter()
    {
        throw new ParameterException([
            'message' => $this->getError()
        ]);
    }

    /*    protected function isPositiveInteger($value, $rule='', $data='', $field='')
    {
        if (is_numeric($value) && is_int($value + 0) && ($value + 0) > 0) {
            return true;
        }
        return $field . '必须是正整数';
    }*/
}