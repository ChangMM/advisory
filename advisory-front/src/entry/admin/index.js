/* eslint-disable no-new */
require('../../scss/admin.scss')
import Vue from 'vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'
import Header from './Header.vue'
import Meet from './Meet.vue'
import Speed from './Speed.vue'
import Nav from './Nav.vue'

let WarnPlugin = require('../../components/Warn/Warn.js')
Vue.use(VueResource)
Vue.use(VueRouter)
Vue.use(WarnPlugin)
Vue.http.options.emulateJSON = true
let routes = [
  {path: '/', redirect: '/speed'},
  {path: '/speed', component: Speed},
  {path: '/meet', component: Meet}
]
let router = new VueRouter({
  routes: routes
})
new Vue({
  router: router,
  components: {
    'header-component': Header,
    'nav-component': Nav
  }
}).$mount('#app')
