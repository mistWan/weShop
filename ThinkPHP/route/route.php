<?php


Route::group('api', function ()
{
//    横幅API
    Route::get('banner/:id', '\app\api\controller\BannerController@index');

//    主题API
    Route::get('themes/:count', '\app\api\controller\ThemeController@index');
    Route::get('theme/:id', '\app\api\controller\ThemeController@show');

//    商品API
    Route::get('latest', '\app\api\controller\ProductController@index');
    Route::get('product/:product_id', '\app\api\controller\ProductController@show');
    Route::put('product', '\app\api\controller\ProductController@update');
    Route::delete('product', '\app\api\controller\ProductController@delete');

//    购物车API
    Route::get('cart', '\app\api\controller\ProductController@cart');

//    分类API
    Route::get('categories', '\app\api\controller\CategoryController@index');
    Route::get('category/:id', '\app\api\controller\CategoryController@category');

//    令牌API
    Route::post('token/get', '\app\api\controller\TokenController@get');
    Route::post('token/verify', '\app\api\controller\TokenController@verify');

//    地址API
    Route::get('address/index', '\app\api\controller\AddressController@index');
    Route::post('address/create', '\app\api\controller\AddressController@create');

//    商品页面添加购物车
    Route::post('user/create', '\app\api\controller\UserController@create');

//    订单API
    Route::get('order/index', '\app\api\controller\OrderController@index');
    Route::post('order/create', '\app\api\controller\OrderController@create');
    Route::get('order/show/:order_no', '\app\api\controller\OrderController@show');
    Route::put('order/edit/:id', '\app\api\controller\OrderController@edit');
})/*->cache(3600)*/;
