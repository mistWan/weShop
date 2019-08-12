// pages/orders/orders.js
import {Orders} from "../../models/orders";

Page({

  data: {

  },
  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    Orders.getOrders().then(response => {
      console.log(response)
      this.setData({
        orders: response
      })
    })
  }
})