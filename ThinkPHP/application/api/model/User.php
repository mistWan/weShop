<?php
namespace app\api\model;

use think\Db;

/**
 * Class User
 * @package app\api\model
 */
class User extends Base
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
     * @var array
     */
    protected $hidden = ['created_at', 'updated_at'];

    /**
     * @return \think\model\relation\BelongsToMany
     */
    public function products()
    {
        return $this->belongsToMany('product', 'order_product', 'product_id', 'user_id');
    }

    /**
     * @param $openId
     * @return int|mixed|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getUserId($openId)
    {
        $user =  $this->where(['openid' => $openId])->find();
        if (is_null($user)) {
            return Db::name('user')->insertGetId(['openid' => $openId]);
        }
        return $user->id;
    }

    /**
     * @param $id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getCart($id)
    {
        $data = self::with(['products', 'products.image'])->find($id)->toArray()['products'];
        $array = array();
        $len = count($data);
        $j = 0;
        for ($i = $len - 1 ; $i >= 0; $i --) {
            if ($data[$i]['pivot']['status'] == 0) {
                $array[$j] = [
                    'product_id' => $data[$i]['id'],
                    'name' => $data[$i]['name'],
                    'price' => $data[$i]['price'],
                    'stock' => $data[$i]['stock'],
                    'image' => $data[$i]['image']['url'],
                    'id' => $data[$i]['pivot']['id'],
                    'count' => $data[$i]['pivot']['count'],
                    'status' => $data[$i]['pivot']['status']
                ];
                $j ++;
            }
        }
        return $array;
    }
}