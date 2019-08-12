<?php


namespace app\exception;


class TokenException extends BaseException
{
    public $status = 401;
    public $message = 'Token 已过期或无效 Token';
    public $code = 10001;
}