import {Http} from "../services/http";

// 订单列表请求
export class Orders
{
  static getOrders () {
    const options = {
      url: `order/index`
    }
    return Http.request(options)
  }
}