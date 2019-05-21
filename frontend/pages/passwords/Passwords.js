import Vue from 'vue'
import PasswordsEdit from './Edit'
import PasswordsNew from './New'
import PasswordsUpdate from './Update'

new Vue({
  el: '#app',
  components: {
    PasswordsEdit,
    PasswordsNew,
    PasswordsUpdate
  }
})
