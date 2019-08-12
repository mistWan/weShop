<?php


namespace app\api\model;


/**
 * Class Banner
 * @package app\api\model
 */
class Banner extends Base
{
    /**
     * @var array
     */
    protected $hidden = ['name', 'description', 'id', 'created_at', 'updated_at'];

    /**
     * @return \think\model\relation\HasMany
     */
    public function items()
    {
        return $this->hasMany('banner_item');
    }

    /**
     * @param $id
     * @return array
     * @throws \app\exception\MissException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getBanner($id)
    {
        $collection = self::with(['items', 'items.image'])->find($id);
        $collection = $this->judgeArray($collection, 'Banner');
        $data = array();
        foreach ($collection['items'] as $value) {
            $data[] = [
                'id' => $value['id'],
                'type' => $value['type'],
                'image' => $value['image']['url']
            ];
        }
        return $data;
    }
}