import {Config} from "./config";
import {Http} from "./http";

export class Token
{
  constructor() {}

  static verify() {
    const token = wx.getStorageSync(Config.token)
    // console.log(token);
    if (token) {
      this.verifyToken(token)
    } else {
      this.getToken()
    }
  }

  static getToken() {
    return new Promise(((resolve, reject) => {
      wx.login({
        success: login => {
          console.log(login.code)
          wx.request({
            url: Config.host + 'token/get',
            method:'POST',
            data: {
              code: login.code
            },
            success: response => {
              wx.setStorageSync(Config.token, response.data.token)
              resolve(response.data.token)
            }
          })
        }
      })
    }))
  }

  static verifyToken(token)
  {
    return new Promise(((resolve, reject) => {
      wx.request({
        url: Config.host + 'token/verify',
        method:'POST',
        data: {token},
        success: response => {
          if(!response.data.verify) {
            this.getToken()
          }
        }
      })
    }))
  }
}