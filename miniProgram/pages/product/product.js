// pages/product/product.js
import {Product} from "../../models/product";

Page({
  data: {
    cart: 0,
    counts: [1,2,3,4,5,6,7,8,9,10],
    count: 1,
    currentIndex: 0,
    product: null
  },
  onLoad: function (options) {
    const id = options.id
    Product.getProduct(id).then(response => {
      console.log(response)
      this.setData({
        product: response,
        cart: response.count,
        count: response.count
      })
    })
  },
  onCount: function (event) {
    this.setData({
      count: this.data.counts[event.detail.value]
    })
  },
  onTab: function (event) {
    let index = event.currentTarget.dataset.index
    this.setData({
      currentIndex: index
    })
  },
  onCart: function (event) {
    let count = this.data.count;
    count = count > 0 ? count : 1
    this.setData({
      cart: count
    })
    Product.postProduct({
      count,
      product_id: this.data.product.id
    }).then(response => {
      console.log(response);
    })
  },
  onNav: function (event) {
    wx.switchTab({
      url: '/pages/cart/cart'
    })
  },
  onShareAppMessage: function () {
    return {
      title: 'SHOP',
      path: 'pages/product/product?id=' + this.data.id
    }
  },
})

