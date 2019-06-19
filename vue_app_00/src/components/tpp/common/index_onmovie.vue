<template>
    <div class="onmovie">
        <div class="onmovietop">
            <p>热映影片</p> 
            <a href="javascript:;" class="weeklist"><img src="../../../assets/paixingbang.png" alt=""> 周票房榜</a>
            <a href="javascript:;">全部39部<i class="iconfont icon-gengduo"></i> </a>
        </div>
         <ul class="onmoviebot" :style="{'margin-left':marginL+'px'}" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
            <li v-for="(i) of 10" :key="i">
                <a href="javascript:;" class="onmoviebotImg">
                    <img src="hyr01.jpg" alt="">
                    <p class="screen">3D IMAX</p>
                    <p class="score">淘票票评分 7.0</p>
                    <p class="mtitle">黑衣人：全。。。</p>
                </a>
                <a href="javascript:;" class="pay">购票</a>
            </li>
        </ul> 

    </div>
</template>
<script>
export default {
    data(){return{
        x1:0,
        x2:0,
        x3:0,
        xchange:0, //x 改变值 x3-x1
        marginL:0, //margin-left
        screenWidth:document.body.clientWidth,
        movieW:0
       
    }},
     methods:{
        touchstart(e){ //按下
            this.x1=e.touches[0].pageX;
        },
        touchmove(e){//移动
             this.movieW=this.screenWidth-(e.target.offsetWidth+8)*10-16;
                this.x2=e.touches[0].pageX;
                this.marginL=this.x2-this.x1+this.xchange; //margin-left
        },
        touchend(e){//抬起
            this.x3=e.changedTouches[0].pageX;
              this.xchange+=(this.x3-this.x1);
               this.marginL=this.xchange;
             if( this.marginL>0){ 
                  this.marginL=0;
                 this.xchange=0
                 }else if(this.marginL<this.movieW){ //img.width-window.innerWidth
                    this.marginL=this.movieW;
                    this.xchange=this.movieW
                 }else{
                this.marginL= this.marginL;
              }
        }
    },
}
</script>

<style scoped>
.onmovie{
    margin-top: -1.3rem;
    padding:13px;
    padding-top: 30px;
    background: #fff;
    border-radius: 10px;
    position: relative;
}
    .onmovietop{height:30px;}
    .onmovietop>p{
        float: left;
        color:#000;
        font-size:1rem;
        margin-bottom: 0;
        /* margin:0 0.7rem; */
    }
    .weeklist{
        float: left;
        width: 5rem;
        margin-left: 10px;
        font-size: 0.7rem;
        text-align: center;
        border: 1px solid rgb(245, 240, 106);
        border-radius: 5px;
        color: #F6A553;
    }
    .onmovietop>a+a{
        float:right;
        /* margin-right:0.7rem; */
        color:#555;
        font-size:0.9rem;
    }
    .onmoviebot{display: flex}
    /* .onmoviebot>li{padding-right:8px;} */
    .onmoviebotImg{
        display: block;
        width:120px;
        position: relative;
        margin-right:8px;
        /* height: 150px; */
    }
    .onmoviebotImg>img{
        width:100%;
        height:100%;
        border-radius: 3px;
    }
    .screen{
        text-align: center;
        width: 60px;
        height: 18px;
        line-height: 18px;
        position: absolute;
        top: 4px;
        left: 3px;
        background: rgba(255,255,255,0.8);
        color: #000;
        border-radius: 5px;
        font-size: 10px;
    }
    .score{
        position: absolute;
        left: 4px;
        bottom: 20px;
        color: #F6A553;
    }
    .mtitle{
        color: #000;
        font-size: 15px;
        margin:3px 0;
    }
    .pay{
        display: block;
        width: 65px;
        height: 33px;
        background-image: linear-gradient(to right, #ee91ab 0%, #FF556F 100%);
        border-radius: 17px;
        color: #fff;
        line-height: 33px;
        text-align: center;
        font-size: 15px
        }
</style>
