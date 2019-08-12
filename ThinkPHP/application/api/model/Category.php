<?php


namespace app\api\model;


/**
 * Class Category
 * @package app\api\model
 */
class Category extends Base
{
    /**
     * @return \think\model\relation\BelongsTo
     */
    public function image()
    {
        return $this->belongsTo('image');
    }

    /**
     * @return \think\model\relation\HasMany
     */
    public function product()
    {
        return $this->hasMany('product');
    }

    /**
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getCategories()
    {
        return self::with('image')->select();
    }

    /**
     * @param $id
     * @return array|null|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getProducts($id)
    {
        return self::with(['image', 'product',  'product.image'])->find($id);
    }
}