<?php


namespace app\api\model;


/**
 * Class Product
 * @package app\api\model
 */
class Product extends Base
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
    protected $hidden = ['updated_at', 'created_at', 'image_id'];

    /**
     * @return \think\model\relation\BelongsTo
     */
    public function image()
    {
        return $this->belongsTo('image');
    }

    /**
     * @return \think\model\relation\BelongsToMany
     */
    public function users()
    {
        return $this->belongsToMany('User', 'order_product', 'user_id', 'product_id');
    }

    /**
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getLatest()
    {
        return self::with('image')->order(['created_at' => 'desc'])->limit(10)->select();
    }

    /**
     * @param $product_id
     * @param $user_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getProduct($product_id, $user_id)
    {
        $data = self::with(['image', 'users'])->hidden(['image_id', 'updated_at', 'created_at', 'users' => ['openid', 'pivot.updated_at', 'pivot.created_at']])->find($product_id)->toArray();
        $data['image'] = $data['image']['url'];
        if (count($data['users'])) {
            foreach ($data['users'] as $value) {
                if ($value['id'] == $user_id && $value['pivot']['status'] == 0) {
                    $data['users'] = $value['pivot'];
                    $data['count'] = $value['pivot']['count'];
                }
            }
        }
        unset($data['users']);
        if (!array_key_exists('count', $data)) {
            $data['count'] = 0;
        }
        return $data;
    }
}

