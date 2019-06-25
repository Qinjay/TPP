<template>
    <div class="t2" ref="t2fixed">
            <div class="t2top">
                <a class="t2left" href="javascipt:;">
                    <span>武汉</span>
                    <i class="iconfont icon-xiajiantou"></i>
                </a>
                <div class="t2mid">
                    <span class="t2topactive">电影</span>
                    <span>影院</span>
                </div>
                <div class="t2right">
                    <a href="javascript:;"><img src="../../../../assets/location.png" alt=""></a>
                    <a href="javascript:;"><img src="../../../../assets/fangdajing_1.png" alt=""></a>
                </div>
            </div>
            <div class="t2bot" :class="{'t2bot-fixed':t2Top<=-44}">
                <div @click="changeCol(0)" :class="{'sel':myCol==0}">正在上映</div>
                <div @click="changeCol(1)" :class="{'sel':myCol==1}">即将上映</div>
            </div>
            <div style="height:40px" v-show="t2Top<=-44"></div>
                <mt-tab-container v-model="active">
                    <mt-tab-container-item id="t2-onmovie">
                        <div class="t2-onmovie-com" v-for="(item,i) of 6" :key="i">
                            <div>
                                <a href="javascript:;" class="t2-onmovie-com-left"><img src="qyqx.jpg" alt=""></a>
                                <a href="javascript:;" class="t2-onmovie-com-mid">
                                    <div>
                                        <p><span class="mtitle">千与千寻</span><span class="screen" :class="{'screen-2D':true,'screen-3D':false}"><img src="screen.png" alt=""></span> </p>
                                        <p class="score">淘票票评分 <span class="myfont1">9.6</span></p>
                                        <p class="direct">导演：<span>宫崎骏</span></p>
                                        <p class="star">主演：<span>周冬雨 井柏然</span></p>
                                        <p><span class="tohost">今日最热</span><span class="tobast">口碑最佳</span></p>
                                   </div>
                                   <div class="t2-onmovie-com-right">
                                    <a href="javascript:;">购票</a>
                                </div>
                                </a>
                                
                            </div>
                            <p class="t2-onmovie-com-bot"><span class="myfont2">经典</span><span>千与千寻的8个回忆</span></p>
                        </div>
                    </mt-tab-container-item>
                    <mt-tab-container-item id="t2-unmovie">
                        <unmovie></unmovie>
                    </mt-tab-container-item>
                </mt-tab-container>

            </div>

</template>
<script>
import unmovie from "./movieList_uncom.vue";
export default {
    data(){return{
        tab:["t2-onmovie","t2-unmovie"],
        myCol:0,
        active:'t2-onmovie',
        listmovieY:0,
        t2Top:100
    }},
     mounted(){
        window.addEventListener("scroll",this.listmovieYChange);
    },
    methods:{
        changeCol(i){
            this.myCol=i;
            this.active=this.tab[i]
        },
        listmovieYChange(){
            this.t2Top=this.$refs.t2fixed.getBoundingClientRect().top;//获取当前元素到屏幕顶端的距离
            // console.log(this.t2Top)
        }
    },
    components:{unmovie}
}
</script>

<style scoped>
.myfont1,.myfont2{color:#F6A553;font-size:16px;}
.myfont1{font-weight: bold}
.myfont2{
   border-right: 1px solid #ddd;
    padding: 0 10px;
    }
    .screen{
        display: inline-block;
        overflow: hidden;
    }
.screen-2D{
    height: 14px;
    width: 60px;  
}
.screen-3D{
    height: 14px;
    width:65px;
}
.screen>img{
    width:100%;
    height:auto;
}
.screen-3D>img{
    margin-top:-14px;
}
.t2{background:#fff;}
    .t2top{
        display: flex;
        justify-content: space-between;
        vertical-align:middle;
        padding: 16px 16px 0;
    }
    .t2top a{color:#000}
    .t2mid{
        width:9rem;
        border: 2px solid #FF627F;
        border-radius: 4px;
        display: flex;
    }
    .t2mid>span{
        text-align: center;
        width:50%;
        display:block;
        font-size:14px;
        line-height: 23px;
        padding: 0 0.4rem;
        color:#FF627F;
    }
    .t2mid>.t2topactive{
        background: #FF627F;
        color:#fff;
    }
    .t2right>a{margin:0 2px;}
    .t2bot{
        display: flex;
        justify-content: space-around;
        vertical-align: middle;
        padding-top: 10px;
        color: #555;
    }
    .t2bot-fixed{
        position: fixed;
        top:0;
        width:100%;
        background:#fff;
        border-bottom: 1px solid #ddd;
        z-index: 999;
        padding: 10px 0;
    }
    .t2bot>div.sel:after{
        content: "";
        display: block;
        width:50%;
        height: 4px;
        background:#FF627F;
        margin: 2px auto;
        border-radius: 2px;
    }
    .t2-onmovie-com{
        margin: 9px;
        padding-top: 15px;
        border-top:1px solid #ddd;
        /* border-bottom: 1px solid #ddd; */
        }
    .t2-onmovie-com-left{
        width:25%;
        height:auto;
        float: left;
        margin-right: 7px;
    }
     .t2-onmovie-com-left>img{
        width:100%;
        height:auto;
    }
    .t2-onmovie-com-mid{
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 6px 6px 6px;
        border-bottom: 1px solid #ddd;
    }
    .t2-onmovie-com-mid p{margin:3px;color:#8f8f94;font-size:14px;}
   .t2-onmovie-com-mid .mtitle{
        font-size:22px;
        color: #000;
        margin-right: 4px;
        }
   .t2-onmovie-com-mid .score{
        font-size:14px;
        color:#000;
    }
    .tobast,.tohost{
        padding: 2px;
        margin: 0px 3px;
        font-size: 10px;
        border-radius: 5px;
    }
    .tohost{
        border:1px solid #FF627F;
        color:#FF627F;
    }

    .tobast{
        border:1px solid #007ACC;
        color:#007ACC;
    }
    .t2-onmovie-com-right{
      
        width:20%;
        height:25px;
        text-align: center;
        line-height: 25px;
        background-image: linear-gradient(to right, #ee91ab 0%, #FF556F 100%);
        border-radius: 13px;

        font-size:10px;
        margin-top:-12%;
        
    }
    .t2-onmovie-com-right>a{color:#fff;}
    .t2-onmovie-com>div:after{
        content: "";
        display: block;
        clear: both;
    }
    .t2-onmovie-com-bot{
        padding-top: 10px;
        margin: 0;
        margin-left: 25%;

    }
</style>

