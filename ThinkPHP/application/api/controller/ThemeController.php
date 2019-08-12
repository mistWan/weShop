<?php


namespace app\api\controller;


use app\api\model\Theme;
use think\App;
use think\Controller;

/**
 * Class ThemeController
 * @package app\api\controller
 */
class ThemeController extends Controller
{
    /**
     * @var Theme
     */
    protected $theme;

    /**
     * ThemeController constructor.
     * @param Theme $theme
     */
    public function __construct(Theme $theme)
    {
        $this->theme = $theme;
    }

    /**
     * @param $count
     * @return \think\response\Json
     */
    public function index($count)
    {
        return json($this->theme->getThemes($count));
    }

    /**
     * @param $id
     * @return \think\response\Json
     */
    public function show($id)
    {
        return json($this->theme->getTheme($id));
    }
}