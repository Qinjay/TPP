<template>
    <div class="detail">
        <p class="myfont">演职人员</p>
        <div class="castsCom" :style="{'margin-left':marginL+'px'}" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
            <div  v-for="(item,i) of Mcasts" :key="i" >
                <div class="castsImg">
                    <img :src="'casts/'+i+'.jpg'" alt="">
                </div>
                <p class="castsName">{{item.name}}</p>
                <!-- <p>导演  饰xxx</p> -->
            </div>
        </div>
        <p>全部{{Mcasts.length}}位演职人员</p>
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
    }},
    props:{
        Mcasts:{typt:Object}
        },
    methods:{
        touchstart(e){ //按下
            this.x1=e.touches[0].pageX;
            },
        touchmove(e){//移动
            this.movieW=this.screenWidth-(e.target.offsetWidth+15)*4-16;
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
.detail{ border-bottom: 1px solid #eee;}
.myfont{
    font-size: 18px;
    color: #000;
    margin: 13px 0;
}
.detail>p:last-child{
    font-size: 14px;
    text-align:center;
    color: #007aff;
    margin: 8px 0;
}
    .castsName{
        text-align: center;
        font-size:15px;
        color:#000;
        margin:5px;
    }
.castsCom{
    display:flex;
   
}
    .castsCom>div{
        margin-right:15px;
    }
    .castsImg{
        width:105px;
        height:150px
    }
     .castsImg>img{
         width:100%;
         height:100%
     }

</style>
