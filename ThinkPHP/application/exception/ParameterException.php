<?php

namespace app\exception;

/*
 * 请求参数类异常
 * */
class ParameterException extends BaseException
{
    public $status = 400;
    public $message = 'Invalid parameters';
    public $code = 10000;
}