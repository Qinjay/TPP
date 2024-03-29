//引入axios库并且配置
//1.引入Vue
import Vue from "vue";
//2.引入axios库
import axios from "axios"
//3.设置跨域请求保存session
axios.defaults.withCredentials=true;
//4.设置请求服务器基础路径
//axios.defaults.baseURL="http://127.0.0.1:3000/";
///5.注册axios 
Vue.prototype.axios=axios;

//注册api
//Vue.prototype.HOST = "/api"
Vue.config.productionTip = false


// 7.在main.js引入axios 