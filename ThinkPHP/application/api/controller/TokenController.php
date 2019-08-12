<?php


namespace app\api\controller;


use app\api\service\UserToken;
use think\facade\Log;
use think\Request;

/**
 * Class TokenController
 * @package app\api\controller
 */
class TokenController
{
    /**
     * @var Request
     */
    protected $request;

    /**
     * TokenController constructor.
     * @param Request $request
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    /**
     * @param UserToken $token
     * @return \think\response\Json
     * @throws \app\exception\WeChatException
     */
    public function get(UserToken $token)
    {
        $code = $this->request->param('code');
        $token = $token->get($code);
        return json(compact('token'));
    }

    /**
     * @param UserToken $userToken
     * @return \think\response\Json
     */
    public function verify(UserToken $userToken)
    {
        $token = $this->request->param('token');
        $valid = $userToken->verify($token);
        return json(compact('valid'));
    }
}