<template>
    <div class="index">
        <title-bar></title-bar>
        <div class="indexf0">
            <mt-swipe :auto="2500" :show-indicators="false">
                <mt-swipe-item v-for="(item,i) of imgImg" :key="i">
                    <a href="javascript:;" class="carouselImg"><img :src=item alt=""/></a>
                </mt-swipe-item>
            </mt-swipe>
        </div>
        <on-movie></on-movie>
        <un-movie></un-movie>
        <host-show></host-show>
        <recommend></recommend>
    </div>
</template>

<script>
import titleBar from "./index_titleBar.vue";
import onMovie from "./index_onmovie.vue";
import unMovie from "./index_unmovie.vue.vue";
import hostShow from "./index_hostshow.vue";
import recommend from "./index_recommend.vue"
export default {
   
    data(){return{
        imgImg:["index/carousel/ban01.jpg","index/carousel/ban02.jpg","index/carousel/ban03.jpg","index/carousel/ban04.jpg","index/carousel/ban05.jpg","index/carousel/ban06.jpg","index/carousel/ban07.jpg"],
    }},

    components:{titleBar,onMovie,unMovie,hostShow,recommend}
}
</script>



<style>
.index{position: relative;}
.indexf0{
    width:100%;
    height:15rem;
    }
    .carouselImg{display:block}
    .carouselImg>img{width:100%;height:100%}
</style>

