// pages/category/category.js
import {Category} from "../../models/category";

Page({
  data: {
    currentId: 0
  },
  onLoad: function () {
    Category.getCategories().then(response => {
      this.setData({
        category: response,
        currentId: response[0].id
      })
      Category.getCategory(response[0].id).then(response => {
        console.log(response)
        this.setData({
          products: response
        })
      })
    })
  },
  onTab: function (event) {
    let id = event.currentTarget.dataset.id
    this.setData({
      currentId: id
    })
    Category.getCategory(id).then(response => {
      this.setData({
        products: response
      })
    })
  }
})