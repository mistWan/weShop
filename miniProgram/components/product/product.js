// components/products/products.js
// 产品列表组件
Component({
  options: {
    styleIsolation: 'isolated'
  },

  properties: {
    products: {
      type: Array,
      value: 'url',
    }
  },

  methods: {
    tranProduct (event) {
      let id = event.currentTarget.dataset.id
      // this.triggerEvent('product', {id}, {})
      wx.navigateTo({
        url: '../product/product?id=' + id
      })
    }
  }
})
