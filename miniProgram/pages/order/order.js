// pages/order/order.js
import {Order} from "../../models/order";

Page({

  data: {
    order: {}
  },

  onLoad: function (options) {
    // console.log(options.order_no)
    Order.getOrder(options.order_no).then(response => {
      // console.log(response)
      this.setData({
        order: response
      })
    })
  },
  onPay: function () {
    const id = this.data.order.id
    Order.pushOrder(id).then(response => {
      if (response === this.data.order.products.length) {
        console.log(response)
        wx.navigateTo({
          url: '/pages/orders/orders'
        })
      }
    })
  }
})
