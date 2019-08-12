import {Http} from "../services/http";

// 分类请求
export class Category extends Http
{
  static getCategories() {
    const options = {
      url: `categories`
    }
    return Http.request(options)
  }

  static getCategory(id) {
    const options = {
      url: `category/${id}`
    }
    return Http.request(options)
  }
}