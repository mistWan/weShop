<?php

namespace app\api\service;

class HttpClient
{
    private $header;
    private $cookie;
    private $timeout;

    /**
     * @return mixed
     */
    public function getHeader()
    {
        return $this->header;
    }

    /**
     * @param $header
     * @return $this
     */
    public function setHeader($header)
    {
        $this->header = $header;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getCookie()
    {
        return $this->cookie;
    }

    /**
     * @param $cookie
     * @return $this
     */
    public function setCookie($cookie)
    {
        $this->cookie = $cookie;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getTimeout()
    {
        return $this->timeout;
    }

    /**
     * @param $timeout
     * @return $this
     */
    public function setTimeout($timeout)
    {
        $this->timeout = $timeout;
        return $this;
    }

    /**
     * @param $url
     * @param array $param
     * @return mixed|string
     */
    public function get($url, $param = [])
    {
        return $this->curl($url, $param, 'get');
    }

    /**
     * @param $url
     * @param array $param
     * @return mixed|string
     */
    public function post($url, $param = [])
    {
        return $this->curl($url, $param, 'post');
    }

    /**
     * @param $url
     * @param array $param
     * @param string $method
     * @return mixed|string
     */
    private function curl($url, $param = [], $method = 'post')
    {
//        $calculate_time1 = microtime(true);
        // 初始化
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_CERTINFO , true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        //curl_setopt($curl, CURLOPT_VERBOSE, true); //打印日志

        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1);//函数中加入下面这条语句

        if($this->getTimeout()){
            curl_setopt($curl, CURLOPT_TIMEOUT, $this->getTimeout());
        }else{
            curl_setopt($curl, CURLOPT_TIMEOUT, 5);
        }

        /*if(array_key_exists("HTTP_USER_AGENT",$_SERVER)){
            curl_setopt($curl, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        }*/

        if($this->getHeader()){
            $headerArr = [];
            foreach( $this->getHeader() as $key => $value ) {
                $headerArr[] = $key .': ' . $value;
            }
            curl_setopt ($curl, CURLOPT_HTTPHEADER , $headerArr );  //构造IP
        }

        if($this->getCookie()){
            curl_setopt($curl, CURLOPT_COOKIE, $this->getCookie());
        }


        // post处理
        if ($method == 'post')
        {
            curl_setopt($curl, CURLOPT_POST, TRUE);
            if(is_array($param)){
//                $param = http_build_query($param);
                $param = json_encode($param);
            }
            curl_setopt($curl, CURLOPT_POSTFIELDS, $param);
        }else{
            curl_setopt($curl, CURLOPT_POST, FALSE);
        }

        // 执行输出
        $info = curl_exec($curl);

        //log
        $errno = curl_errno($curl);
        $error = '';
        if($errno)
        {
            $error = curl_error($curl);
        }
        curl_close($curl);
//        $calculate_time_span = microtime(true) - $calculate_time1;
        /*$log = RuntimePath().DIRECTORY_SEPARATOR.'curl.log';
        file_put_contents($log,date('Y-m-d H:i:s')." [ time:{$calculate_time_span} ] url: {$url} \nmethod: {$method} \ndata: ".json_encode($param)." \nresult: {$info} \nerrorno: {$_errno} error: {$_error} \n",FILE_APPEND);*/
        if( $error ){
            return $error;
        }

        return $info;
    }
}