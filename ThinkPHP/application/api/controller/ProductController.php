<?php


namespace app\api\controller;


use app\api\model\OrderProduct;
use app\api\model\Product;
use app\api\model\User;
use app\api\service\Token;
use think\Request;

/**
 * Class ProductController
 * @package app\api\controller
 */
class ProductController extends BaseController
{
    /**
     * @param Product $product
     * @return \think\response\Json
     */
    public function index(Product $product)
    {
        return json($product->getLatest());
    }

    /**
     * @param Product $product
     * @param $product_id
     * @return \think\response\Json
     */
    public function show(Product $product, $product_id)
    {
        return json($product->getProduct($product_id, $this->id));
    }

    /**
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function update(Request $request)
    {
        $id = $request->param('id');
        $count = $request->param('count');
        $result = OrderProduct::where([
            'id' => $id,
            'user_id' => $this->id
        ])->update(compact('count'));
        return json($result);
    }

    /**
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function delete(Request $request)
    {
        $result = OrderProduct::where([
            'id' => $request->param('id'),
            'user_id' => $this->id
        ])->delete();
        return json($result);
    }

    /**
     * @param User $user
     * @return \think\response\Json
     */
    public function cart(User $user)
    {
        return json($user->getCart($this->id));
    }
}