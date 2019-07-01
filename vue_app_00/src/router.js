import Vue from 'vue'
import Router from 'vue-router'
import home from "./components/home.vue"
import register from "./components/tpp/common/register.vue"
import login from './components/tpp/common/login.vue'
import detail from './components/tpp/common/details.vue'
import ticket from './components/tpp/common/movieticket.vue'
import cinemaMap from './components/tpp/common/cinemaMap.vue'
Vue.use(Router)

export default new Router({
  routes: [
    // {path:"/tpp",component:tpp},
    {path:"/",redirect:"/home"},
    {path:"/home",component:home},
    {path:"/login",component:login},
    {path:"/register",component:register},
    {path:"/detail/:mid",component:detail,props:true},
    {path:"/ticket/:cid",component:ticket,props:true},
    {path:"/cmap/:cid",component:cinemaMap,props:true}

  ]
})
