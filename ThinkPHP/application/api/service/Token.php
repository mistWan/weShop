<?php /** @noinspection ALL */


namespace app\api\service;


use app\exception\TokenException;

/**
 * Class Token
 * @package app\api\service
 */
class Token
{
    /**
     * @param $length
     * @return string
     */
    protected function generate($length)
    {
        $str = '';
        $char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        $max = strlen($char)-1;
        for ($i = 0; $i < $length; $i ++) {
            $str .= $char[rand(0, $max)];
        }
        return $str;
    }

    /**
     * @param $token
     * @param null $id
     * @return mixed
     * @throws TokenException
     */
    public function getId($token, $id = null)
    {
        $cache = cache($token);

        if (!$cache) {
            throw new TokenException();
        }
        $value = [];
        if (is_array($cache)) {
            $value = $cache;
        } else {
            $value = json_decode($cache, true);
        }

        if ($value['scope'] == Enum::Super) {
            /*
             * 管理员
             * */
        }
        return $value['id'];
    }
}