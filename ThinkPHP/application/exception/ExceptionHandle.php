<?php

namespace app\exception;

use Exception;
use think\exception\Handle;
use think\facade\Log;
use think\facade\Request;

/*
 * 重写Handle的render方法，实现自定义异常消息
 */
class ExceptionHandle extends Handle
{
    private $status;
    private $message;
    private $code;
    public function render(Exception $e)
    {
        if ($e instanceof BaseException) {
            $this->status = $e->status;
            $this->message = $e->message;
            $this->code = $e->code;
        } else {
            if (config('app_debug')) {
                return parent::render($e);
            }
            $this->status = 500;
            $this->message = 'I Internal Server Error';
            $this->code = 999;
            Log::save($e);
        }
        $result = [
            'message' => $this->message,
            'code' => $this->code,
            'url' => Request::url(true)
        ];
        return json($result, $this->status);
    }
}