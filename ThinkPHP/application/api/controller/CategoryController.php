<?php


namespace app\api\controller;


use app\api\model\Category;
use think\Controller;

/**
 * Class CategoryController
 * @package app\api\controller
 */
class CategoryController extends Controller
{
    /**
     * @var Category
     */
    private $category;

    /**
     * CategoryController constructor.
     * @param Category $category
     */
    public function __construct(Category $category)
    {
        $this->category = $category;
    }

    /**
     * @return \think\response\Json
     */
    public function index()
    {
        return json($this->category->getCategories());
    }

    /**
     * @param $id
     * @return \think\response\Json
     */
    public function category($id)
    {
        return json($this->category->getProducts($id));
    }

}