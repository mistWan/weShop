<?php

namespace app\api\controller;


use app\api\model\Banner;
use app\api\validate\BannerValidate;
use think\Controller;

/**
 * Class BannerController
 * @package app\api\controller
 */
class BannerController extends Controller
{
    /**
     * @param BannerValidate $bannerValidate
     * @param Banner $banner
     * @param $id
     * @return \think\response\Json|void
     * @throws \app\exception\ParameterException
     */
    public function index(BannerValidate $bannerValidate, Banner $banner, $id)
    {
        $validate = $bannerValidate->check(request()->only('id'));
        if (!$validate) {
            return $bannerValidate->invalidParameter();
        }
        return json($banner->getBanner($id));
    }
}