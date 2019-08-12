<?php


namespace app\exception;


class WeChatException extends BaseException
{
    public $status = 400;
    public $message = 'weChat unknown error';
    public $code = 999;
}