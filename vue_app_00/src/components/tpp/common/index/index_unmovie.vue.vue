<template>
    <div class="onmovie">
        <div class="onmovietop">
            <p>即将上映</p> 
            <a href="javascript:;" class="weeklist"><img src="../../../../assets/paixingbang.png" alt=""> 想看榜</a>
            <a href="javascript:;">全部<i class="iconfont icon-gengduo"></i> </a>
        </div>
         <ul class="onmoviebot"  :style="{'margin-left':marginL+'px'}" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
            <li v-for="(item,i) of unMovies" :key="i">
                <a href="javascript:;" class="onmoviebotImg">
                    <img :src="'/mymovie/'+item.mid+'.jpg'" alt="">
                    <p class="screen">{{item.screen}}</p>
                    <i class="iconfont icon-aixin collect"></i>
                    <p class="score">73.5万人想看</p>
                    <p class="mtitle">{{item.mtitle.slice(0,7)}} <span v-show='item.mtitle.length>5'>...</span></p>
                </a>
            <a href="javascript:;" class="release-time">{{item.release_time.slice(6,7)}}月{{item.release_time.slice(8,10)}}日</a>
            </li>
            <li class="goMoreMovie">
                <a href="javascript:;">查看全部</a>
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
        movieW:0,
        unMovies:[],
        isonload:0
       
    }},
    created(){
        // 表movie_list  isonload=0
        this.axios.get("http://127.0.0.1:3000/user/unmovie",{params:{isonload:this.isonload}}).then((data)=>{
             this.unMovies=data.data.data
            // console.log( this.unMovies)
        })
    },
     methods:{
        touchstart(e){ //按下
            this.x1=e.touches[0].pageX;
        },
        touchmove(e){//移动
             this.movieW=this.screenWidth-(e.target.offsetWidth+8)*11-16;
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
    margin:10px 0;
    padding:13px;
    background: #fff;

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
        margin-left: 10px;
        width: 4rem;
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
    .onmoviebot{display: -webkit-box;}
    .onmoviebot>li{padding-right:8px;}
    .onmoviebotImg{
        display: block;
        width:120px;
        position: relative;
        height: 215px;
    }
    .onmoviebotImg>img{
        width:100%;
        height:85%;
        border-radius: 3px;
    }
    .screen{
        text-align: center;
        padding: 0 5px;
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
    .collect{
        position: absolute;
        top: 0px;
        right: 0px;
        color: #fff;
        background: rgba(255,255,255,0.3);
        border-radius: 2px;
        width: 22px;
        text-align: center;
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
    .release-time{
        font-size: 10px;
        color:#8f8f94;
    }
    .goMoreMovie{
        width: 128px;
        height: 172px;
        position: relative;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .goMoreMovie>a{
        position: absolute;
        top: 50%;
        left: 21%;
        color: #8f8f94;
        white-space: nowrap;
    }

</style>
