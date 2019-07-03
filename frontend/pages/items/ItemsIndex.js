import Vue from 'vue'
import ItemsIndex from './Index'
import Paginate from 'vuejs-paginate'

Vue.component('paginate', Paginate)

new Vue({
  el: '#app',
  components: {
    ItemsIndex
  }
})
