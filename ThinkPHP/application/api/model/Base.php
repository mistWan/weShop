<?php


namespace app\api\model;


use app\exception\MissException;
use think\Model;

/**
 * Class Base
 * @package app\api\model
 */
class Base extends Model
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
     * @param $value
     * @param $data
     * @return string
     */
    public function setImagePath($value, $data)
    {
        $image = $value;
        if ($data['from'] == 1) {
            $image = config('profile.host') . config('profile.image') . $value;
        }
        return $image;
    }

    /**
     * @param $array
     * @param $name
     * @return mixed
     * @throws MissException
     */
    protected function judgeArray($array, $name)
    {
        if (is_null($array)) {
            throw new MissException([
                'message' => $name . ' not found'
            ]);
        }
        return $array;
    }
}

