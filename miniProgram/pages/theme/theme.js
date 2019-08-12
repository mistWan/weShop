// pages/theme/theme.js
import {Theme} from "../../models/theme";

Page({
  onLoad: function (options) {
    this.data.description = options.description
    const id = options.id
    Theme.getTheme(id).then(response => {
      this.setData({
        theme: response
      })
    })
  },

  onReady: function () {
    wx.setNavigationBarTitle({
      title: this.data.description
    })
  }
})