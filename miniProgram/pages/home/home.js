// pages/home/home.js
import {Home} from "../../models/home";

Page({
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    Home.getBanner(1).then(response => {
      this.setData({
        images: response
      })
    })
    Home.getThemes(3).then(response => {
      this.setData({
        themes: response
      })
    })
    Home.getLatest().then(response => {
      this.setData({
        latest: response
      })
    })
  },
  onTheme: event => {
    const id = event.currentTarget.dataset.id
    const description = event.currentTarget.dataset.description
    wx.navigateTo({
      url: '../theme/theme?id=' + id + '&description=' + description
    })
  },
  onProduct: event => {
    let id = event.currentTarget.dataset.id
    wx.navigateTo({
      url: '../product/product?id=' + id
    })
  }
})