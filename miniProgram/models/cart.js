import {Http} from "../services/http";

// 购物车请求
export class Cart extends Http
{
  static getCart() {
    const options = {
      url: `cart`
    }
    return Http.request(options)
  }

  static putCart(data) {
    const options = {
      url: `product`,
      method: 'PUT',
      data
    }
    return Http.request(options)
  }

  static deleteCart(data) {
    const options = {
      url: `product`,
      method: 'DELETE',
      data
    }
    return Http.request(options)
  }

  static postCart(data) {
    const options = {
      url: `order/create`,
      method: 'POST',
      data
    }
    return Http.request(options)
  }
}