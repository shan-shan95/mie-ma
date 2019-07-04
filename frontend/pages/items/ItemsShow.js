import Vue from 'vue'
import ItemsShow from './Show'
import Rails from 'rails-ujs'

new Vue({
  el: '#app',
  components: {
    ItemsShow
  }
})

Rails.start()
