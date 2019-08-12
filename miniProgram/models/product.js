import {Http} from "../services/http";

// 产品请求
export class Product extends Http
{
  static getProduct(id) {
    const options = {
      url: `product/${id}`
    }
    return Http.request(options)
  }
  static postProduct(data) {
    const options = {
      url: `user/create`,
      data: data,
      method: 'POST'
    }
    return Http.request(options)
  }
}