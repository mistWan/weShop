import {Http} from "../services/http";

// 主题请求
export class Theme extends Http
{
  static getTheme(id) {
    const options = {
      url: `theme/${id}`
    }
    return Http.request(options)
  }
}