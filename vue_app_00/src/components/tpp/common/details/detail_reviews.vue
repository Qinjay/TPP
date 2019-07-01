<template>
    <div>
        <p class="myfont">热门评论</p>
        <div class="review-top" v-for="(item,i) of Reviews" :key="i"><!---->
            <div class="author">
                <div class="authorImg">
                    <img src="favicon.ico" alt=""><span>{{item.author.name}}</span><!---->
                </div>
                <div><i class="iconfont icon-fenxiang"></i></div>
            </div>
            <div class="reviewCom">
            <span>{{item.summary}}</span>
            </div>
            <div class="review-bot">
                <div class="good"><Add></Add></div>
                <div class="ask"><i class="iconfont icon-pinglun"></i><span>15</span></div>
            </div>
        </div>
    </div>
</template>
<script>
import Add from "./add.vue"
export default {
    data(){return{
        n:0
    }},
    props:{Reviews:{typt:Object}},
    methods:{
       
    },
    components:{Add}
}
</script>
<style>
    .myfont{
        font-size: 18px;
        color: #000;
        margin: 13px 0;
    }
    .review-top{
        margin: 10px 0;
        padding: 10px 0;
        border-bottom: 1px solid #eee;
    }
    .author{
        display: flex;
        justify-content: space-between;
        align-items: center;

    }
    .authorImg{
        display:flex;
        align-items: center;
        /* width:10%; */
    }
    .authorImg>img{margin:0 5px;}
    .reviewCom{
        font-size: 14px;
        color: #000;
        line-height: 25px;
        padding: 15px 0;
        /* border-bottom: 1px solid #eee; */
    }
    .review-bot{
        display: flex;
        justify-content: flex-end;
        color: #8f8f94;
    }
    .good{margin-right: 15px;}
</style>

