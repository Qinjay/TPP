<template>
    <div class="commovie" ref="commovie">
        <div class="commovie-top" :class="{'comtop-fixed':commovieF>1100}">
            <p id="recommend"  @click="indexChange(0)" :class="{'myfont':mc==0}">精选推荐</p>
            <p id="attention"  @click="indexChange(1)" :class="{'myfont':mc==1}">我关注的</p>
            <span><i class="iconfont icon-shuaxin"></i>获取新内容</span>
        </div>
        <div style="height:37px;width:100%" v-show="commovieF>1100"></div>
        <mt-tab-container v-model="active" class="commovie-tab" swipeable>
            <mt-tab-container-item id="recommend">
                <!-- <mt-cell> -->
                    <div class="recommendTab" v-for="(item,i) of 5" :key="i">
                        <a href="javascript:;" class="recommendTab-top">
                            <div class="reTab-top-img"><img src="hyr01.jpg" alt=""></div> <!--电影图片-->
                            <div class="recommendTab-top-mid">
                                <p>绝杀慕尼黑</p>  <!--电影名-->
                                <p>电影根据体育历史中著名的。。</p>  <!--电影介绍-->
                            </div>
                            <p class="attend">✚关注</p>
                        </a>
                        <a href="javascript:;" class="reTabVideo">
                            <img src="hyr03.jpg" alt="">
                            <i class="iconfont icon-youjiantou"></i>
                        </a>
                        <p class="recommendTab-bot">
                            <span>7评 </span><span> 2019-06-03</span> <span class="recommendTab-bot-del">✖</span>
                        </p>
                    </div>
                <!-- </mt-cell> -->
            </mt-tab-container-item>
            <mt-tab-container-item id="attention">
                <mt-cell>
                     <div class="attention-a">
                        <!-- <div>为您推荐优质媒体号</div>  <div><i class="iconfont icon-shuaxin"></i>换一换</div> -->
                        <p>“复联”二人组也救不了稀烂的《黑衣人》</p>
                        <div class="attention-a-con">
                            <img src="hyr02.jpg" alt=""><img src="hyr02.jpg" alt=""><img src="hyr02.jpg" alt="">
                        </div>
                        <p><span> 电影头条</span><span>2评</span> <span>2019-04-25</span> </p>
                    </div>
                </mt-cell>
            </mt-tab-container-item>
        </mt-tab-container>
    </div>
</template>
<script>
export default {
    data(){return{
        active:"recommend",
        tab:["recommend","attention"],
        mc:0,
        commovieY:0,
        commovieF:100,
    }},
    mounted(){
        window.addEventListener("scroll",this.commovieYChange);
    },
    methods:{
        indexChange(i){
            this.active=this.tab[i];
            this.mc=i  
        },
        commovieYChange(){
          this.commovieF=window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
            // console.log(this.commovieF)
        }
    }
}
</script>
<style scoped>
.commovie{background:#fff;padding:12px;}
.commovie-top{
    width:100%;
    height:40px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    background:#fff;
    }
    .commovie-top>p{
        width:75x;
        text-align: center;
        float: left;
        margin: 0  12px;
        font-size:18px;
        line-height: 30px;
        color:#8f8f94;
    }
    .commovie-top>span{
        float: right;
    }
   .commovie-top .myfont{color:#000;border-bottom: 2px solid #000;}
   .commovie-top>span{
       font-size:15px;
       color: #555;
   }
   .icon-shuaxin{font-size:20px;margin-right:6px;}
   .mint-cell-value{width:100%!important}
   .recommendTab{width:100%}
   .recommendTab-top{
       display: block;
        width: 100%;
        padding: 10px 0;
   }
   .recommendTab-top>div{
       float: left;
   }
   .recommendTab-top>p{
       float: right;
   }
   .reTab-top-img{
       width: 37px;
        height: 37px;
        border-radius: 50%;
        overflow: hidden;
        margin-right: 10px;
   }
   .reTab-top-img>img{
       width:100%;
   }
   .reTabVideo{
      display: block;
        width: 100%;
        /* height: 230px; */
        border-radius: 6px;
        overflow: hidden;
        position: relative;
       }
   .reTabVideo>img{
       width:100%;
       height:100%;
       }
    .recommendTab-top-mid>p{
        font-size:18px;
        color:#000;
    }
    .recommendTab-top-mid>p+p{
        margin-bottom: 10px;
        font-size:10px;
        color:#555;

        }
    .attend{
        width: 60px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        border: 1px solid #FF556F;
        border-radius: 18px;
        color: #FF556F;
        font-size: 14px;
    }
    .icon-youjiantou{
        position: absolute;
        font-size: 35px;
        color: #eee;
        top: 45%;
        left: 48%;
    }
.recommendTab-bot{
    margin:10px 0;
}
.attention-a{
    width:100%;
    color:#555;
}
    .attention-a>p{
        font-size:18px;
        color: #000;
        margin:10px 0;
    }
    .attention-a-con{
        width:100%;
        /* height:120px; */
    }
    .attention-a-con>img{
        width:31%;
        height:100%
    }
    .attention-a-con>img:nth-child(2){
        margin:0 8px;
    }
    .attention-a>p>span{
        color:#8f8f94;
        font-size:14px;
        margin-right:5px;
    }
    .recommendTab{
        border-bottom:1px solid #ddd;
        padding-top:8px;
    }
    .recommendTab-bot-del{
        float:right;
        margin-right:5px;
    }
    .comtop-fixed{
        position: fixed;
        top: 58px;
        left: 0;
        z-index:999;
        padding:0 12px;
    }
   /* .mint-cell-title{
       display: none!important;
         -webkit-box-flex: 1!important;
        -ms-flex: 1;
        flex: 0; 
    }  */
</style>
