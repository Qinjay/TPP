import Vue from 'vue'
import Router from 'vue-router'
// import tpp from "./components/tpp/index.vue"
import home from "./components/home.vue"
import login from './components/tpp/common/login.vue'
Vue.use(Router)

export default new Router({
  routes: [
    // {path:"/tpp",component:tpp},
    {path:"/",redirect:"/home"},
    {path:"/home",component:home},
    {path:"/login",component:login}

  ]
})
