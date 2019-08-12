<?php


namespace app\api\controller;


use app\api\service\Token;
use think\Controller;
use think\Request;

/**
 * Class BaseController
 * @package app\api\controller
 */
class BaseController extends Controller
{
    /**
     * @var mixed
     */
    protected $id;

    /**
     * BaseController constructor.
     * @param Request $request
     * @param Token $token
     * @throws \app\exception\TokenException
     */
    public function __construct(Request $request, Token $token)
    {
        $header = $request->header('token');
        $this->id = $token->getId($header);
    }
}