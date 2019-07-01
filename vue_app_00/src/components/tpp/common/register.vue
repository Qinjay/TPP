<template>
    <div class="register" :style="{height:Height+'px'}">
        <div class="regTitle">
            <router-link to="/login" class="iconfont icon-fanhui"></router-link>
            <span>快速注册</span>
        </div>
        <div class="uName">
            <input type="number" placeholder="请输入手机号码" v-model="value" name="uname" >
            <span v-show=value.length @click="unameDel">✖</span>
        </div>
        <div class="uPwd">
            <input type="text" placeholder="请输入验证码" v-model="value1" maxlength="6" name="upwd">
            <span to="" class="myfont" @click="getTelNum">获取验证码</span>
        </div>
        <button class="regbtn" :disabled=isDisable @click="reg">同意协议并注册</button>
        <p>我已阅读并同意以下协议 
            <router-link to="">《淘宝平台服务协议》</router-link>、
            <router-link to="">《隐式权政策》</router-link>、
            <router-link to="">《法律声明》</router-link>、
            <router-link to="">《支付宝及客户端服务协议》</router-link></p>
    </div>
</template>
<script>

export default {
    data(){return{
        value:"",
        value1:"",
        isDisable:true,
        Height:window.innerHeight,
        yzm:0,
        zname:'',
    }},
    computed:{
        regbtn(){
            const {value,value1}=this;
            return {value,value1}
        }
    },
    watch:{
        regbtn:{
            handler:function(newval,oldval){
                if(this.value.length!=0&&this.value1.length!=0){
                    this.isDisable=false;
                }else{
                    this.isDisable=true;
                }
            }
        }
    },
    methods:{
        unameDel(){
            this.value=""
        },
        getTelNum(){
            var reg=/^1[34578]\d{9}$/;
            if(!reg.test(this.value)){
                this.$toast({
                     message: '输入正确手机号',
                     duration: 3000
                })
            }else{
                this.yzm=parseInt(Math.random()*1000000);
                console.log(this.yzm)
                this.$toast({
                     message: `验证码为${this.yzm}`,
                     duration: 3000
                })
            }
        },
        reg(){
            if(this.value1==this.yzm){
                let params={uname:this.value,upwd:this.yzm}
              console.log(params)
                   this.axios.get("http://localhost:3000/user/reg",{params}).then((result)=>{
                    if(result.data.code==200){
                        // console.log(result)
                        this.zname=result.data.data+this.value.slice(-5,-1);
                        sessionStorage.setItem('username', this.zname);
                       this.$router.push("/home")
                    }else{
                        this.$toast({
                        message: `注册失败，稍后再试`,
                        duration: 3000
                        })
                    }
               })
             }else{
                 this.$toast({
                     message: `验证码为有误`,
                     duration: 3000
                 })
             }
        },
    }
}
</script>

<style scoped>
    .register{
        width:100%;
        background:#fff;
        padding: 13px;
    }
    .register input{
        border:none;
        outline: 0;
        padding: 0;
        margin: 0;
        width:80%;
    }
    .regTitle>i{
        font-size:25px;
    }
    .regTitle>span{
        display: inline-block;
        font-size:25px;
        margin-left: 10%;
    }
    .uName{margin-top:30%;}
    .uName>span{float:right;}
    .myfont{
        /* float:right; */
        color:#ff5000;
        background:#eee;
        font-size: 10px;
        line-height: 28px;
        width: 83px;
        height: 25px;
        text-align: center;
        border-radius: 13px;
        }
    .uName,.uPwd{
        border-bottom: 1px solid #ff5000;
    }
    .uPwd{
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
        height:55px;
    }
    .regbtn{
         font-size: 18px;
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
</style>
