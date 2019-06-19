<template>
    <div>
        <div v-if="active=='index'" class="t1">
            <a class="t1left" href="javascipt:;">
                <span>武汉</span>
                <img src="../../assets/xiajiantou.png" alt="">
            </a>
            <div class="t1rigt">
                <a href="javascript:;"><img src="../../assets/saoyisao.png" alt=""></a>
                <a href="javascript:;"><img src="../../assets/rili.png" alt=""></a>
                <a href="javascript:;"><img src="../../assets/sousuo.png" alt=""></a>
            </div>
        </div>
        <div v-else-if="active=='movie'" class="t2">
            <div class="t2top">
                <a class="t2left" href="javascipt:;">
                    <span>武汉</span>
                    <i class="iconfont icon-xiajiantou"></i>
                </a>
                <div class="t2mid">
                    <span class="t2topactive">电影</span>
                    <span>影院</span>
                </div>

                <mt-tab-container :active.sync="active">
                    <mt-tab-container-item id="tab-container1"><span>电影</span> 
                        <mt-cell>11111</mt-cell>
                    </mt-tab-container-item>
                    <mt-tab-container-item id="tab-container2"><span>影院</span> 
                        <mt-cell>22222</mt-cell>
                    </mt-tab-container-item>
                </mt-tab-container>






                <div class="t2right">
                    <a href="javascript:;"><img src="../../assets/location.png" alt=""></a>
                    <a href="javascript:;"><img src="../../assets/fangdajing_1.png" alt=""></a>
                </div>
            </div>
            <div class="t2bot">

            </div>
        </div>
        <div v-else-if="active=='video'">淘气视屏</div>
        <div v-else-if="active=='show'">演出</div>
        <div v-else>我的</div>

    </div>

</template>
<script>
export default {
    data(){return{}},
    props:{
       search:{type:Function},
       active:{default:""}
    }
}
</script>
<style scoped>
.t1{
    width: 90%;
    margin:0 auto;
    padding:1rem 0;
    display: flex;
    justify-content:space-between;
    background:rgba(255,255,255,1);
    /* align-items: center; */
    }
   .t1 a{
        display:block;
        color:#000;
    }
    .t1left>img{
        vertical-align: middle;
        }
    .t1rigt{display:flex;}
    .t1rigt>a{margin:0 5px;}
.t2top{
        display: flex;
        justify-content: space-between;
        vertical-align:middle;
        padding: 1rem;
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

</style>
