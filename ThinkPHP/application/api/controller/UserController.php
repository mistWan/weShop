<?php

namespace app\api\controller;

use app\api\model\OrderProduct;
use think\Request;

/**
 * Class UserController
 * @package app\api\controller
 */
class UserController extends BaseController
{
    /**
     * @param Request $request
     * @param OrderProduct $orderProduct
     * @return \think\response\Json
     */
    public function create(Request $request, OrderProduct $orderProduct)
    {
        $data = $request->only(['product_id', 'count']);
        $data['user_id'] = $this->id;
        $result = $orderProduct->createOrUpdate($data);
        return json($result);
    }
}

