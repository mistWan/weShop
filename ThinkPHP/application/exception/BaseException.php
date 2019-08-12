<?php

namespace app\exception;


use think\Exception;

/**
 * Class BaseException
 * 自定义异常类的基类
 */
class BaseException extends Exception
{
    public $status = 400;
    public $message = 'Bad request';
    public $code = 999;

    /**
     * 构造函数，接收一个关联数组
     * @param array $params 关联数组只应包含status、message和code，且不应该是空值
     */
    public function __construct($params = [])
    {
        if (!is_array($params)) {
            return;
        }
        if (array_key_exists('status', $params)) {
            $this->status = $params['status'];
        }

        if (array_key_exists('message', $params)) {
            $this->message = $params['message'];
        }

        if (array_key_exists('code', $params)) {
            $this->code = $params['code'];
        }
    }
}


