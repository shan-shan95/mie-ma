import Vue from 'vue'
import App from '../components/app.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: 'app',
    components: {
      App
    },
    template: '<App/>'
  })
})
