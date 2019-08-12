<?php


namespace app\api\model;


use think\facade\Log;

/**
 * Class OrderProduct
 * @package app\api\model
 */
class OrderProduct extends Base
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
     * @param $data
     * @return bool|int|string
     */
    public function createOrUpdate($data)
    {
        Db::startTrans();
        try {
            $data['status'] = 0;
            $find = $this->where([
                'user_id' => $data['user_id'],
                'product_id' => $data['product_id'],
                'status' => 0
            ])->find();
            if (empty($find)) {
                return $this->save($data);
            }
            $update = $this->where([
                'user_id' => $data['user_id'],
                'product_id' => $data['product_id'],
                'status' => 0
            ])->update(['count' => $data['count']]);
            Db::commit();
            return $update;
        } catch (\Exception $e) {
        // 回滚事务
            Db::rollback();
            Log::error($e);
        }
    }
}