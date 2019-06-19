import Vue from 'vue'
import Router from 'vue-router'
// import tpp from "./components/tpp/index.vue"
import home from "./components/home.vue"
Vue.use(Router)

export default new Router({
  routes: [
    // {path:"/tpp",component:tpp},
    {path:"/",redirect:"/home"},
    {path:"/home",component:home},

  ]
})
