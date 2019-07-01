<template>
    <div>
        <router-link to="/login" class="login" :style="{'height':loginH+'px'}">
            <div class="logDiv">
                <div class="loginImg">
                    <img src="login.jpg" alt="">
                    <p class="log" v-show="logname==''">立即登录</p>
                    <p class="log"  v-show="logname">{{logname}}</p>
                </div>
                <i class="iconfont icon-gengduo"></i>
            </div>
        </router-link>
            <div class="loginfixed">
                <router-link to=""><i class="iconfont icon-shezhi"></i></router-link>
                <router-link to=""><i class="iconfont icon-xiaoxizhongxin"></i></router-link>
            </div>
            <div class="loginfixed2" :style="{'opacity':opacity}">
                <router-link to=""><i class="iconfont icon-shezhi"></i></router-link>
                <router-link to="">我的</router-link>
                <router-link to=""><i class="iconfont icon-xiaoxizhongxin"></i></router-link>
            </div>
            <div class="login-note">
                <router-link to=""><i class="iconfont icon-xiaoxizhongxin"></i><p>电影票</p></router-link>
                <router-link to=""><i class="iconfont icon-youhuiquan"></i><p>优惠券</p></router-link>
                <router-link to=""><i class="iconfont icon-yingchengka"></i><p>权益卡</p></router-link>
                <router-link to=""><i class="iconfont icon-yanchu"></i><p>演出票</p></router-link>
            </div>
            <router-link to="" class="vip"><img src="88vip.png" alt=""></router-link>
            <div class="loginCom">
                <router-link to="" v-for="(item,i) of loginList" :key="i"><span>{{item.Loga}}</span><span><i class="iconfont icon-gengduo"></i></span></router-link>
            </div>
    </div>
</template>
<script>
import bus from '../bus.js'
export default {
    data(){return{
        logname:"",
        scrolltop:0,
        opacity:0,
        loginH:0,
        loginList:[
            {Lhref:"/want",Loga:"想看的电影和演出"},
            {Lhref:"/want",Loga:"看过的电影"},
            {Lhref:"/want",Loga:"淘票票乐影卡"},
            {Lhref:"/want",Loga:"我的小剧场"},
            {Lhref:"/want",Loga:"发起的讨论"},
            {Lhref:"/want",Loga:"银行卡特惠"},
            {Lhref:"/want",Loga:"阿里鱼商城"},
            {Lhref:"/want",Loga:"娱乐宝"},
            {Lhref:"/want",Loga:"帮助与反馈"},
            {Lhref:"/want",Loga:"3小时公益"},
            ]
    }},
    created(){
        this.loginH=window.innerWidth*0.5;
    },
    mounted(){
        window.addEventListener("scroll",this.handleScroll);
        //bus.$on("val",(data)=>{this.logname=data;console.log(this.logname)})
         this.logname=sessionStorage.getItem('username');
            //console.log(this.logname)
    },
    methods:{
        handleScroll(){
            this.scrolltop=window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
            this.opacity=this.scrolltop/50
        },
    },
}
</script>

<style scoped>
    .loginfixed,.loginfixed2{
       position:fixed;
       width:100%;
       top: 0;
        display: flex;
        justify-content: space-between;
        padding:15px;
    }
    .loginfixed>a{
         color:rgb(255,255,255);
          
    }
    .loginfixed2{
        background:#fff;
        opacity:0;
        }
    .loginfixed .iconfont,.loginfixed2 .iconfont{
        font-size:23px;
    }
    .loginfixed2>a{
        color:#000;
    }
.logDiv{
   display: flex;
   justify-content: space-between;
   align-items: center;
   padding: 13px;
}
    .login{
       display:flex;
        background-image: url("../../../../../public/loginBj.jpg");
        color:#fff;
        align-items: center;
        
    }
    .loginImg{
        width:20%;
        display: flex;
        align-items: center;
    }
    
    .log{
        color:#fff;
        white-space:nowrap; 
        font-size:18px; 
        margin: 5px;
        }
    .loginImg>img{
        width:100%;
        border-radius: 50%;
        /* overflow: hidden; */
        }
    .icon-gengduo{
        /* float:right; */
        }
    .login-note{
        display: flex;
        justify-content: space-around;
        text-align: center;
        background:#fff;
    }
    .login-note .iconfont{
        font-size:27px;
        line-height: 45px;
    }
    .login-note p{
        color:#000;
    }
    .login-note .icon-xiaoxizhongxin{
        color:#ef4a4a;
    }
    .icon-youhuiquan{
        color:#F6A553
    }
    .icon-yingchengka{color:#007aff}
    .icon-yanchu{color:#9840f3}
    .vip{
        display: block;
        width: 100%;
    }
    .vip>img{width:100%}
    .loginCom{
        background:#fff;
    }
    .loginCom>a{
        display:flex;
        justify-content: space-between;
        border-bottom:1px solid #ddd;
        padding: 12px;
        color:#000;
        font-size:15px;
    }
    /* .icon-gengduos{color:#000;} */
</style>
