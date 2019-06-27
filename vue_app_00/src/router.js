import Vue from 'vue'
import Router from 'vue-router'
import home from "./components/home.vue"
import register from "./components/tpp/common/register.vue"
import login from './components/tpp/common/login.vue'
import detail from './components/tpp/common/details.vue'
Vue.use(Router)

export default new Router({
  routes: [
    // {path:"/tpp",component:tpp},
    {path:"/",redirect:"/home"},
    {path:"/home",component:home},
    {path:"/login",component:login},
    {path:"/register",component:register},
    {path:"/detail",component:detail}

  ]
})
