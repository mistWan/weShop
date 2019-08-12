import {Http} from "../services/http";

// 订单请求
export class Order extends Http
{
  static getOrder(order_no) {
    const options = {
      url: `order/show/${order_no}`
    }
    return Http.request(options)
  }

  static pushOrder(id) {
    const options = {
      url: `order/edit/${id}`,
      method: 'PUT'
    }
    return Http.request(options)
  }
}