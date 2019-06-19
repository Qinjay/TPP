<template>
    <div class="commovie">
        <div class="commovie-top">
            <p id="recommend"  @click="indexChange(0)" :class="{'myfont':mc==0}">精选推荐</p>
            <p id="attention"  @click="indexChange(1)" :class="{'myfont':mc==1}">我关注的</p>
            <span><i class="iconfont icon-shuaxin"></i>获取新内容</span>
        </div>
        <mt-tab-container v-model="active" class="commovie-tab" swipeable>
            <mt-tab-container-item id="recommend">
                <mt-cell>
                    <div class="recommendTab">
                        <a href="javascript:;" class="recommendTab-top">
                            <div class="reTab-top-img"><img src="hyr01.jpg" alt=""></div> <!--电影图片-->
                            <div class="recommendTab-top-mid">
                                <p>绝杀慕尼黑</p>  <!--电影名-->
                                <p>电影根据体育历史中著名的。。</p>  <!--电影介绍-->
                            </div>
                            <p class="attend">✚关注</p>
                        </a>
                        <a href="javascript:;" class="reTabVideo">
                            <img src="hyr02.jpg" alt="">
                            <i class="iconfont icon-youjiantou"></i>
                        </a>
                        <p class="recommendTab-bot">
                            <span>7评 </span><span> 2019-06-03</span>
                        </p>
                    </div>
                </mt-cell>
            </mt-tab-container-item>
            <mt-tab-container-item id="attention">
                <mt-cell>00000000</mt-cell>
            </mt-tab-container-item>
        </mt-tab-container>
    </div>
</template>
<script>
export default {
    data(){return{
        active:"recommend",
        tab:["recommend","attention"],
        mc:0
    }},
    created(){
        
    },
    methods:{
        indexChange(i){
            this.active=this.tab[i];
            this.mc=i  
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
    }
    .commovie-top>p{
        width:100px;
        text-align: center;
        float: left;
        margin: 0px;
        font-size:18px;
        line-height: 30px;
        color:#555;
    }
    .commovie-top>span{
        float: right;
    }
   .commovie-top .myfont{color:#000}
   .commovie-top>span{
       font-size:15px;
       color: #555;
   }
   .icon-shuaxin{font-size:20px;margin-right:6px;}
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
        height: 230px;
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
        width: 73px;
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
</style>
