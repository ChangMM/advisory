import Vue from 'vue'
import Login from './Login.vue'
import VueResource from 'vue-resource'
Vue.use(VueResource)
let WarnPlugin = require('../../components/Warn/Warn.js')
Vue.use(WarnPlugin)
Vue.http.options.emulateJSON = true
new Vue({
  components: {
    'login-component': Login
  }
}).$mount('#app')
