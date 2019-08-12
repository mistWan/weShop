<?php


namespace app\api\controller;


use app\api\model\Order;
use app\api\service\OrderService;
use think\facade\Log;
use think\Request;

/**
 * Class OrderController
 * @package app\api\controller
 */
class OrderController extends BaseController
{
    /**
     * @param Order $order
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index(Order $order)
    {
        $orders = $order->where(['user_id' => $this->id])->order(['updated_at' => 'desc'])->select();
        return json($orders);
    }

    /**
     * @param Request $request
     * @param OrderService $orderService
     * @return \think\response\Json
     */
    public function create(Request $request, OrderService $orderService)
    {
        /*$params = [
            ['id' => 17, "product_id" => 3,"count" => 2],
            ['id' => 5, "product_id" => 5,"count" => 6],
            ['id' => 6, "product_id" => 6,"count" => 8]
        ];*/
//        Log::error($request->param('products'));
        $params = $request->param('products');
        $order = $orderService->handleOrder($params, $this->id);
        return json($order);
    }

    /**
     * @param Request $request
     * @param Order $order
     * @return \think\response\Json
     */
    public function show(Request $request, Order $order)
    {
        $order_no = $request->param('order_no');
        $data = $order->findOrder($order_no, $this->id);
        return json($data);
    }

    /**
     * @param Request $request
     * @param OrderService $orderService
     * @return \think\response\Json
     */
    public function edit(Request $request, OrderService $orderService)
    {
        $id = $request->param('id');
        $result = $orderService->editOrder($id, $this->id);
        return json($result);
    }
}


