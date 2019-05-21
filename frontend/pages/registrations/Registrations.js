import Vue from 'vue'
import RegistrationsCreate from './Create'
import RegistrationsEdit from './Edit'
import RegistrationsNew from './New'
import RegistrationsUpdate from './Update'

new Vue({
  el: '#app',
  components: {
    RegistrationsCreate,
    RegistrationsEdit,
    RegistrationsNew,
    RegistrationsUpdate
  }
})
