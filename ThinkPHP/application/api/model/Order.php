<?php


namespace app\api\model;


/**
 * Class Order
 * @package app\api\model
 */
class Order extends Base
{
    /**
     * @var string
     */
    protected $createTime = 'created_at';
    /**
     * @var string
     */
    protected $updateTime = 'updated_at';

    /**
     * @return \think\model\relation\BelongsToMany
     */
    public function products()
    {
        return $this->belongsToMany('Product', 'OrderProduct',  'product_id','order_id')->order(['updated_at' => 'desc']);
    }

    /**
     * @param $order_no
     * @param int $id
     * @return array|null|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function findOrder($order_no, int $id)
    {
        $products = self::with(['products' , 'products.image'])->where(['order_no' => $order_no, 'user_id' => $id])->find();
        $products['address'] = Address::where(['user_id' => $id])->order(['updated_at' => 'desc'])->find();
        return $products;
    }
}