<?php


namespace app\exception;


/**
 * 404时抛出此异常
 */
class MissException extends BaseException
{
    public $status = 404;
    public $message = 'Not found';
    public $code = 10001;
}