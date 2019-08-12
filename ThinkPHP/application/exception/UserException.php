<?php


namespace app\exception;


class UserException extends BaseException
{
    public $status = 404;
    public $message = '用户不存在';
    public $code = 60000;
}