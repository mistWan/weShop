<?php

namespace app\api\controller;

use app\api\model\Address;
use app\exception\AddressException;
use think\Request;

/**
 * Class AddressController
 * @package app\api\controller
 */
class AddressController extends BaseController
{
    /**
     * @return \think\response\Json
     * @throws AddressException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $address = Address::where('user_id', $this->id)->select();
        if ($address->isEmpty()) {
            throw new AddressException();
        }
        return json(compact('address'));
    }

    /**
     * @param Request $request
     * @return \think\response\Json
     */
    public function create(Request $request)
    {
        $data = $request->param();
        $data['user_id'] = $this->id;
        $result = Address::create($data);
        return json(['message' => $result]);
    }
}