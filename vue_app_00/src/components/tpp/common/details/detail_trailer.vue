<template>
    <div class="detail-trailer">
        <p class="myfont">视频</p>
        <div :style="{'margin-left':marginL+'px'}" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
            <div  class="myVideo" v-for="(item,i) of Traile" :key="i">
                <video :controls=isPlay :src="'trailer/'+i+'.mp4'"  ></video>
                <img src="bofang.png" alt="" v-show="!isPlay" @click="Vplay()">
            </div>
        </div>
        <p>全部{{Traile.length}}个视频</p>
    </div>
</template>

<script>
export default {
    data(){return{
        isPlay:false,
        x1:0,
        x2:0,
        x3:0,
        xchange:0, //
        marginL:0, //margin-left
        screenWidth:document.body.clientWidth,
        movieW:0,
    }},
    props:{Traile:''},
    methods:{
        Vplay(){
            this.isPlay= this.isPlay== true ? false : true;
            
        },
        touchstart(e){ //按下
            this.x1=e.touches[0].pageX;
        },
        touchmove(e){//移动
             this.movieW=this.screenWidth-(e.target.offsetWidth+15)*4;
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
    }
}
</script>


<style scoped>
    .detail-trailer{border-bottom: 1px solid #eee}
    .detail-trailer>div{
        display: -webkit-box;
        /* display: flex;
        flex-wrap: nowrap; */
        }
    .myfont{
        font-size: 18px;
        color: #000;
        margin: 13px 0;
    }
    .myVideo{
        width:250px;
        margin:0 10px;
        position: relative;
        /* height:100px; */
    }
     .myVideo>video{
        width:100%;
    }
    .myVideo>img{
        position: absolute;
        top:40%;
        left:42%;
        }
    .detail-trailer>p:last-child{
    font-size: 14px;
    text-align:center;
    color: #007aff;
    margin: 8px 0;
}
</style>
