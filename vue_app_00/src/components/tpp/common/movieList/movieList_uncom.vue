<template>
    <div class="unMovie">
        <div class="hostprevue">
            <p>热门预告片</p>
            <div  :style="{'margin-left':marginL+'px'}" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
                <div v-for="(item,i) of 6" :key="i">
                    <a href="javascript:;" class="prevueImg">
                        <img src="hyr03.jpg" alt="" >
                        <img src="bofang.png" alt="">
                    </a>
                </div>
            </div>
        </div>
        <movielist-unmovie></movielist-unmovie>
        <movielist-date></movielist-date>


    </div>
</template>

<script>
import movielistUnmovie from "../index/index_unmovie.vue.vue";
import movielistDate from "./movieList_date.vue"
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
             this.movieW=this.screenWidth-(e.target.offsetWidth+8)*6-16;
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
    components:{movielistUnmovie,movielistDate},
}
</script>

<style scoped>
    .hostprevue{
        padding:0 13px;
    }
    .hostprevue>p{
        font-size:20px;
        color:#000;
        margin:5px 0;
    }
    .hostprevue>div{
        display: flex;
        display: -webkit-box;
        width:64%;
        }
    .hostprevue>div>div{margin-right:10px;}
    .prevueImg{
        display: block;
        width:100%;
        border-radius:5px;
        overflow: hidden;
        position: relative;
        /* margin-right:5px; */
    }
     .prevueImg img:first-child{
        display: block;
        width:100%;
        height: auto;
    } 
    .prevueImg>img+img{
        position: absolute;
        top: 35%;
        left: 42%;

    }

</style>
