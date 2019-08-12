<?php


namespace app\api\service;


use app\api\model\Address;
use app\api\model\Order;
use app\api\model\OrderProduct;
use app\api\model\Product;
use app\exception\OrderException;
use app\exception\UserException;
use think\facade\Log;

/**
 * Class OrderService
 * @package app\api\service
 */
class OrderService
{

    /**
     * @param $param
     * @param int $id
     * @return Order
     * @throws OrderException
     * @throws UserException
     * @throws \think\Exception\DbException
     */
    public function handleOrder($param, int $id)
    {
        $array = $this->place($param, $id);
//        die();
        $list = Product::with('image')->all($array['data']['product_id'])->toArray();
        $compare = $this->compare($array['raw'], $list);
        $compare['counts'] = $array['data']['counts'];
        $address = Address::find($id);
        $compare['address'] = $address->detail;
        $order = $this->insertOrder($compare, $id, $address->id);
        $update = $this->updateOrderProduct($array['raw'], $order->id);
        return $order;
    }

    /*
     * 计算总数量、查找商品ID、对比用户
     * */
    /**
     * @param $param
     * @param $id
     * @return mixed
     * @throws UserException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function place($param, $id)
    {
        $count = 0;
        $productId = [];
        foreach ($param as $key => $value) {
            $param[$key]['status'] = 1;
            $count += $value['count'];
            $productId[] = $value['product_id'];
        }
        $array['raw'] = $param;
        $array['data'] = [
            'counts' => $count,
            'product_id' => $productId
        ];

//        对比用户
        $products = OrderProduct::where([
            ['user_id', '=', $id],
            ['status', '=', 0]
        ])->select()->toArray();

        $userCount = 0;
        foreach ($products as $value) {
            if (in_array($value['product_id'], $productId)) {
                $userCount ++;
            }
        }

        Log::error('user-count' . $userCount);
        if ($userCount != count($productId)) {
            throw new UserException();
        }

        return $array;
    }

    /*
     * 计算库存
     * */
    /**
     * @param $param
     * @param $list
     * @return array
     * @throws OrderException
     */
    public function compare($param, $list)
    {
        $totals = 0;
        foreach ($param as $key => $value) {
            if ($value['count'] > $list[$key]['stock']) {
                throw new OrderException([
                   'message' => '商品 ' . $list[$key]['name']  . ' 已经卖光啦，谢谢惠顾！'
                ]);
            }
            $param[$key]['name'] = $list[$key]['name'];
            $param[$key]['image'] = $list[$key]['image']['url'];
            $param[$key]['total'] = $list[$key]['price'] * $value['count'];
            $totals += $param[$key]['total'];
        }
        $array = [
          'order' => $param,
          'totals' => $totals
        ];
        return $array;
    }

    /*
     * 更新 Order 表
     * */
    /**
     * @param $compare
     * @param $user_id
     * @param $address_id
     * @return Order
     */
    public function insertOrder($compare, $user_id, $address_id)
    {
        $data = [
            'order_no' => intval(microtime(true) * 10000),
            'user_id' => $user_id,
            'total_price' => $compare['totals'],
            'status' => 1,
            'total_count' => $compare['counts'],
            'address_id' => $address_id
        ];
        $result = Order::create($data);
        return $result;
    }

    /*
     * 更新 OrderProduct 表
     * */
    /**
     * @param $raw
     * @param $id
     * @return \think\Collection
     * @throws OrderException
     */
    private function updateOrderProduct($raw, $id)
    {
        foreach ($raw as $key => $value) {
            $raw[$key]['order_id'] = $id;
        }
        $orderProduct = new OrderProduct();
        $result = $orderProduct->saveAll($raw);
        if (!$result) {
            throw new OrderException();
        }
        return $result;
    }

    /**
     * @param $orderId
     * @param $userId
     * @return int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function editOrder($orderId, $userId)
    {
        $order = Order::update([
           'id' => $orderId,
           'user_id' => $userId,
           'status' => 2
        ]);
        if ($order->id) {
            $data = OrderProduct::where([
                'order_id' => $orderId,
                'user_id' => $userId
            ])->select()->toArray();
            array_walk($data, function (&$item) {
               $item['status'] = 2;
            });
            $result = (new OrderProduct())->saveAll($data);
            return count($result);
        }
    }
}