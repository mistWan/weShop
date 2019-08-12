import { Config } from './config.js'
import {Token} from "./token";

export class Http
{
  constructor() {}

  // http 请求类, 当 fetch 为 true 时，不做未授权重试机制
  static request (options, fetch) {
    return new Promise((resolve, reject) => {
      wx.request({
        url: Config.host + options.url,
        data: options.data || '',
        header: {
          'content-type': 'application/json',
          'token': wx.getStorageSync(Config.token)
        },
        method: options.method || 'GET',
        dataType: 'json',
        responseType: 'text',
        success: response => {
          const status = response.statusCode.toString()
          if (status.charAt(0) === '2') {
            resolve(response.data)
          }
          if (status === '401') {
            if (!fetch) {
              this.fetch(options)
            }
          }

          /*if (!(/^2\d{2}/.test(response.statusCode))) {
            wx.showModal({
              title: 'error',
              content: response.data.message,
              confirmText: 'ok',
              cancelText: 'cancel',
              success (result) {
                if (result.confirm) {
                } else if (result.cancel) {
                }
              }
            })
          } else {
            resolve(response.data)
          }*/
        },
        fail: response => {
          /*wx.showModal({
            title: 'error',
            content: response.errMsg,
            confirmText: 'ok',
            cancelText: 'cancel',
            success (result) {
              if (result.confirm) {
              } else if (result.cancel) {
              }
            }
          })*/
          reject(response)
        },
      })
    })
  }

  static fetch(options) {
    Token.getToken().then(response => {
      this.request(options, true)
    })
  }

  static getTarget(event, key) {
    return event.currentTarget.dataset[key];
  }
}