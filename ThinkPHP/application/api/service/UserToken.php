<?php


namespace app\api\service;


use app\api\model\User;
use app\exception\TokenException;
use app\exception\WeChatException;

class UserToken extends Token
{
    private $http;

    public function __construct(HttpClient $http)
    {
        $this->http = $http;
    }

    /**
     * @param $code
     * @return string
     * @throws TokenException
     * @throws WeChatException
     */
    public function get($code)
    {
        $appId = config('weChat.AppID');
        $appSecret = config('weChat.AppSecret');
        $login = sprintf(config('weChat.code2Session'), $appId, $appSecret, $code);
        $result = json_decode($this->http->get($login), true);

        if (empty($result))  {
            throw new WeChatException([
                'message' => '获取session_key及openID时异常，微信内部错误'
            ]);
        } else {
            // 微信服务器并不会将错误标记为400，无论成功还是失败都标记成200
            // 这样非常不好判断，只能使用errcode是否存在来判断
            $err = array_key_exists('errcode', $result);
            if ($err) {
                throw new WeChatException([
                    'message' => $result['errmsg'],
                    'code' => $result['errcode']
                ]);
            } else {
                return $this->grantToken($result);
            }
        }
    }

    /**
     * @param $result
     * @return string
     * @throws TokenException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function grantToken($result)
    {
        $user = new User();
        $id = $user->getUserId($result['openid']);

        $cache = $result;
        $cache['id'] = $id;
        $cache['scope'] = Enum::User;

        $key = $this->generate(32);
        $value = json_encode($cache);
        $save = cache($key, $value, 7200);
        if (!$save) {
            throw new TokenException([
                'message' => '服务器缓存异常',
                'code' => 10005
            ]);
        }
        return $key;
    }

    /**
     * @param $token
     * @return bool
     */
    public function verify($token)
    {
        $token = cache($token);
        if ($token) {
            return true;
        }
        return false;
    }
}









