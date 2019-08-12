<?php


namespace app\api\model;


/**
 * Class Theme
 * @package app\api\model
 */
class Theme extends Base
{
    /**
     * @return \think\model\relation\BelongsTo
     */
    public function image()
    {
        return $this->belongsTo('image');
    }

    /**
     * @return \think\model\relation\BelongsTo
     */
    public function themeImage()
    {
        return $this->belongsTo('Image', 'theme_image_id', 'id');
    }

    /**
     * @return \think\model\relation\BelongsTo
     */
    public function headImage()
    {
        return $this->belongsTo('Image', 'head_image_id', 'id');
    }

    /**
     * @return \think\model\relation\BelongsToMany
     */
    public function products()
    {
        return $this->belongsToMany('Product');
    }

    /**
     * @param $count
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getThemes($count)
    {
        $data =  $this->order('updated_at')->limit($count)->select();

        foreach ($data as $key => $value) {
            $data[$key]['image'] = $value->themeImage->url;
        }
        return $data;
    }

    /**
     * @param $id
     * @return array|null|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getTheme($id)
    {
        return self::with(['headImage', 'products.image'])->find($id);
    }
}