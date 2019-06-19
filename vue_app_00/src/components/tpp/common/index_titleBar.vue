<template>
    <div class="mtitle">
        <div class="t1bg"  :style="{'top':scrolltop-59+'px'}"></div>
        <div class="t1">
            <a :class="{'t1left':selW}" href="javascipt:;">
                <span>武汉</span>
                <i class="iconfont icon-xiajiantou"></i>
            </a>
            <div class="t1rigt">
                <a href="javascript:;"><img src="../../../assets/saoyisao.png" alt=""></a>
                <a href="javascript:;"><img src="../../../assets/rili.png" alt=""></a>
                <a href="javascript:;"><img src="../../../assets/sousuo.png" alt=""></a>
            </div>
        </div>
        
        <transition name="tsel">
            <div class="sel" v-if="scrolltop>=46&&scrolltop<=59">
                <i class="iconfont icon-sousuo"></i>
                <span>搜影片、影院、影人、演出、咨询、...</span>
            </div>
        </transition>
    </div>
</template>
<script>
export default {
    data(){
        return{
           scrolltop:0,
           selW:true
        }
    },
      mounted(){
        window.addEventListener("scroll",this.handleScroll)
    },
    methods:{
        handleScroll(){
            this.scrolltop=window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
            if(this.scrolltop>59){this.scrolltop=59;}
            if(this.scrolltop>46){ this.selW=false}  
            if(this.scrolltop<46){
                this.selW=true
            }
            // console.log(this.scrolltop)
        },
    },
}
</script>

<style scoped>
.mtitle{
     position: fixed;
        z-index:99999;
        width:100%
}
.t1bg{
    height:59px;width:100%;
    position: absolute;
    background:#fff;
    top:-59px; /*0*/
    left:0;
    z-index:0;
    }
.t1{
    width:100%;
    margin:0 auto;
    padding:1rem;
    display: flex;
    justify-content:space-between;
    background:rgba(255,255,255,0);
    position: absolute;
    z-index:1;
    }
   .t1 a{
        display:block;
        color:#000;
    }
    .t1left>span,.t1left>i{color:#fff}
    .t1left>img{
        vertical-align: middle;
        }
    .t1rigt{display:flex;}
    .t1rigt>a{margin:0 5px;}
    .sel{
        background: #F5F5F5;
        padding: 6px 19px;
        height: 33px;
        border-radius: 5px;
        position: absolute;
        top: 13px;
        right: 12px;
        font-size: 12px;
        color: #555;
        z-index:2;
        overflow: hidden;
    }
    .tsel-enter{ width: 0;}
    .tsel-enter-to{width:200px;}
    .tsel-enter-active{
        transition: all 0.1s
    }
    .icon-sousuo{
        margin-right:5px;
    }
.selw{display: none}
</style>
