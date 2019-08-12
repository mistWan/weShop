// pages/cart/cart.js
import {Cart} from "../../models/cart";

Page({
  data: {
    all: true,
    counts: 0,
    prices: 0,
    cart: []
  },
  onShow: function (options) {
    Cart.getCart().then(response => {
      // console.log(response)
      let cart = response,
          all = this.data.all,
          counts = 0,
          prices = 0,
          len = cart.length
      for (let i = 0; i < len; i++) {
        counts += cart[i].count
        prices += cart[i].count * cart[i].price
      }
      this.setData({
        cart,
        all,
        counts,
        prices: prices.toFixed(2)
      })
    })
  },
  onAll: function () {
    let all = !this.data.all,
        counts = 0,
        prices = 0
    const cart = this.data.cart,
        len = cart.length
    for (let i = 0; i < len; i++) {
      counts += cart[i].count
      prices += Number((cart[i].count * cart[i].price).toFixed(2))
      cart[i].status = all ? 0 : 1
    }
    if (!all || cart.length === 0) {
      counts = 0
      prices = 0
      all = false
    }
    this.setData({
      cart,
      all,
      counts,
      prices: Number(prices).toFixed(2)
    })
  },
  onCount: function (event) {
    const id = Cart.getTarget(event, 'id'),
         type = Cart.getTarget(event, 'type'),
         index = Cart.getTarget(event, 'index')
    let cart = this.data.cart,
        count = cart[index].count,
        stock = cart[index].stock,
        prices = Number(this.data.prices),
        counts = this.data.counts
    if (type === 'sub') {
      if (count === 1)  {
        return false
      }
      cart[index].count = -- count
      if (cart[index].status === 0) {
        counts --
        prices -= Number((cart[index].price * 1).toFixed(2))
      }
    } else {
      if (count === stock) {
        return false
      }
      cart[index].count = ++ count
      if (cart[index].status === 0) {
        counts ++
        prices += Number((cart[index].price * 1).toFixed(2))
      }
    }
    this.setData({
      cart,
      prices: Number(prices.toFixed(2)).toFixed(2),
      counts
    })
    Cart.putCart({id, count})
  },
  onDel:function (event) {
    const id = Cart.getTarget(event, 'id'),
        index = Cart.getTarget(event, 'index')
    let cart = this.data.cart,
        counts = Number(this.data.counts),
        prices = Number(this.data.prices),
        all = this.data.all
    if (cart[index].status === 0) {
      counts -= parseInt(cart[index].count)
      prices -= Number((cart[index].count * cart[index].price).toFixed(2))
    }
    cart.splice(index, 1)
    let len = cart.length,
        selects = 0
    for (let i = 0; i < len; i++) {
      if (cart[i].status === 0) {
        selects ++
      }
    }
    if (len === selects) {
      all = true
    }
    if (cart.length === 0) {
      all = false
    }
    this.setData({
      all,
      cart,
      counts,
      prices: Number(prices.toFixed(2)).toFixed(2)
    })
    Cart.deleteCart({id})
  },
  onSelect: function (event) {
    const index = Cart.getTarget(event, 'index')
    let status = Cart.getTarget(event, 'status'),
        cart = this.data.cart,
        prices = Number(this.data.prices),
        counts = this.data.counts,
        all = this.data.all,
        len = cart.length,
        selects = 0
    status = status ? 0 : 1
    cart[index].status = status
    if (status === 1) {
      all = false
      prices -= Number((cart[index].count * cart[index].price).toFixed(2))
      counts -= cart[index].count
    } else {
      prices += Number((cart[index].count * cart[index].price).toFixed(2))
      counts += Number(cart[index].count)
    }
    for (let i = 0; i < len; i++) {
      if (cart[i].status === 0) {
        selects ++
      }
    }
    all = selects === len
    this.setData({
      cart,
      all,
      prices: Number(prices.toFixed(2)).toFixed(2),
      counts
    })
  },
  onOrder: function (event) {
    let products = new Array(),
        cart = this.data.cart
    for (let i = 0; i < cart.length; i++) {
      if (cart[i].status === 0) {
        products.push({
          product_id: cart[i].product_id,
          count: cart[i].count,
          id: cart[i].id
        })
      }
    }
    if (products.length) {
      Cart.postCart({products}).then(response => {
        wx.navigateTo({
          url: '/pages/order/order?order_no=' + response.order_no
        })
      })
    }
  }
})