import Vue from 'vue'
import VueResource from 'vue-resource'
import App from './App'
let WarnPlugin = require('../../components/Warn/Warn.js')
Vue.use(WarnPlugin)
require('../../scss/_base.scss')
Vue.use(VueResource)
Vue.http.options.emulateJSON = true
new Vue({
  el: '#app',
  template: '<App/>',
  components: { App }
})
