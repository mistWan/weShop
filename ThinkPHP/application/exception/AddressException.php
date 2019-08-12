<?php


namespace app\exception;


class AddressException extends BaseException
{
    public $status = 404;
    public $message = '地址不存在';
    public $code = 60001;
}