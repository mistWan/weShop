// pages/my/my.js
Page({

  data: {
    address: 0
  },

  onLoad: function (options) {

  },

  onAdd: function (event) {
    wx.chooseAddress({
      success: response => {
        this.setData({
          address: response
        })
      }
    })
  },
  onOrders: function () {
    wx.navigateTo({
      url: '/pages/orders/orders'
    })
  }
})