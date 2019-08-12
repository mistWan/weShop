<?php


namespace app\exception;


class OrderException extends BaseException
{
    public $status = 404;
    public $message = '订单中的商品不存在，可能已被删除';
    public $code = 80001;
}