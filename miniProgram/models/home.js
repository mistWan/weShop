import {Http} from "../services/http";

// 主页请求
export class Home extends Http
{
  static getBanner(id) {
    const options = {
      url: `banner/${id}`
    }
    return Http.request(options)
  }

  static getThemes(count) {
    const options = {
      url: `themes/${count}`
    }
    return Http.request(options)
  }

  static getLatest() {
    const options = {
      url: `latest`
    }
    return Http.request(options)
  }


}