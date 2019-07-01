<template>
    <div class="login" :style="{height:Height+'px'}">
        <div class="loginTitle">
            <router-link to="/" class="iconfont icon-fanhui"></router-link>
        </div>
        <div class="logo"><img src="taobao.png" alt=""></div>
        <div class="uName">
            <span v-show="isTell">+86<i class="iconfont icon-gengduo"></i></span>
            <input type="text" :placeholder=unamePlaceholder v-model="value" name="uname">
            <span v-show=value.length @click="unameDel">✖</span>
        </div>
        <div class="uPwd">
            <!-- <div class="uPwd-left"> -->
                <img :src= upwdImg alt="" v-show="!isTell" @click="upwdchange()">
                <input :type= upwdType :placeholder=upwdPlaceholder v-model="value1" name="upwd">
                <span v-show=value1.length @click="upwdDel">✖</span>
            <!-- </div> -->
            <router-link to="" class="myfont" v-show="isTell">获取验证码</router-link>
            <router-link to="" class="myfont" v-show="!isTell">忘记密码</router-link>
        </div>
        <button class="btnlogin" :disabled=isDisable @click="login">登录</button>
        <div class="botChange">
            <span @click="changelog" class="myfont" v-show="!isTell">短信验证码登录</span>
            <span @click="changelog" class="myfont" v-show="isTell">淘宝账户登录</span>
            <router-link to="/register" class="myfont">注册</router-link>   <!--register-->
        </div>
    </div>
</template>
<script>
import bus from './bus.js'
export default {
    data(){return{
        Height:window.innerHeight,
        value:"",
        value1:"",
        isTell:false,
        isSee:false,
        upwdImg:"buxianshimima.png",
        upwdType:"password",
        unamePlaceholder:"请输入淘宝账户",
        upwdPlaceholder:"请输入密码",
        isDisable:true,
        zname:"" , //用户名
        username:''
    }},
    computed:{
        btnSel(){
            const {value,value1}=this;
            return {value,value1}
        }
    },
    watch:{
        btnSel:{
             handler:function(newval, oldval){
                let length=this.value.length;
                let length1=this.value1.length
                if(length!=0&&length1!=0){
                    this.isDisable=false;
                }else{
                    this.isDisable=true;
                }
             }
        }
    },
    methods:{
        login(){
            let params={uname:this.value,upwd:this.value1}
            // console.log( params)
            this.axios.get("http://localhost:3000/user/login",{params}).then((result)=>{
                if(result.data.code==400){
                    this.$toast({
                        message:"用户名或密码错误",
                        duration: 3000
                    })
                }else{
                    this.zname=result.data.data+this.value.slice(-5,-1);
                    sessionStorage.setItem('username', this.zname);
                    // console.log(username)
                    //bus.$emit("val",this.zname) //组件间传值--me-login.vue
                    this.$router.push("home");
                    // console.log(result.data,this.zname)
                }
            })
        },
        changelog(){
            if(this.isTell){
                this.isTell=false;
                this.unamePlaceholder="请输入淘宝账户";
                this.upwdPlaceholder="请输入密码"
            }else{
                this.isTell=true;
                
                this.unamePlaceholder="请输入手机号码";
                this.upwdPlaceholder="请输入验证码"
            }
            this.value="";
            this.value1="";
        },
        upwdchange(){
            if(this.isSee){
                this.isSee=false;
                this.upwdImg="faxianxianshimima.png";
                this.upwdType="text";
            }else{
                this.isSee=true;
                this.upwdImg="buxianshimima.png";
                this.upwdType="password";
            }
        },
        unameDel(){
            this.value="";
        },
        upwdDel(){
            this.value1="";
        },
    }
}
</script>

<style scoped>
.login .myfont{color:#444}
.login{
    background:#fff;
    padding: 13px;
    /* height:100%; */
    }
.loginTitle>i{
    font-size:25px;
}
.login input{
    border:none;
    outline:0;
    margin:0;
    padding:0 3px;;
    height:30px;
}
    .uName,.uPwd{
        border-bottom: 1px solid #ff5000;
    }
    .uName>input{
        width:80%;
        font-size: 16px;
    }
    .uName>span:last-child{float:right;}
    .uPwd{
        display: flex;
        justify-content: space-between;
        align-items:flex-end;
         height:55px;
        }
    .uPwd input{
        width:65%;
        font-size: 16px;
    }
    .logo{
        width: 15%;
        border-radius: 50%;
        overflow: hidden;
        margin: 50px auto;
    }
    .logo>img{
        width:100%;
    }
    .btnlogin{
        font-size: 22px;
        width: 100%;
        color: #fff;
        height: 51px;
        line-height: 50px;
        border: 0;
        border-radius: 24px;
        padding: 0;
        margin: 30px 0;
        background-image: linear-gradient(90deg, #ff9000 0%, #ff5000 100%);
    }
    .botChange{
        display:flex;
        justify-content: space-between;
        /* color:#444; */
    }
    
    /* .botChange>router-link{color:#8f8f94} */
</style>
