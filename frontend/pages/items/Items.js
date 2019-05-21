import Vue from 'vue'
import ItemsEdit from './Edit'
import ItemsIndex from './Index'
import ItemsNew from './New'
import ItemsShow from './Show'
import ItemsTrading from './Trading'

new Vue({
  el: '#app',
  components: {
    ItemsEdit,
    ItemsIndex,
    ItemsNew,
    ItemsShow,
    ItemsTrading
  }
})
