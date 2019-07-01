<template>
    <div class="detail-photos">
        <p class="myfont">剧照</p>
        <div :style="{'margin-left':marginL+'px'}" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
            <div class="myImg" v-for="(item,i) of Photos" :key="i">
                <img :src="'photos/'+i+'.webp'" alt="" >
            </div>
        </div>
        <p>全部{{Photos.length}}张剧照</p>
    </div>
</template>
<script>
export default {
    data(){return{
        x1:0,
        x2:0,
        x3:0,
        xchange:0, //
        marginL:0, //margin-left
        screenWidth:document.body.clientWidth,
        movieW:0,
    }},
    props:{Photos:{typt:Object}},
    methods:{
        touchstart(e){ //按下
            this.x1=e.touches[0].pageX;
        },
        touchmove(e){//移动
             this.movieW=this.screenWidth-(e.target.offsetWidth+8)*10;
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


<style>
.detail-photos{border-bottom: 1px solid #eee}
    .detail-photos>div{ display: -webkit-box;}
    .myfont{
        font-size: 18px;
        color: #000;
        margin: 13px 0;
    }
    .myImg{
        width:250px;
        height: 135px;
        overflow: hidden;
        margin: 0 10px;
    }
    .myImg>img{width:100%}
    .detail-photos>p:last-child{
    font-size: 14px;
    text-align:center;
    color: #007aff;
    margin: 8px 0;
}
</style>
