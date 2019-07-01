<template>
<!-- 入口组件  负责调用子组件 -->
    <div class="page-tabbar"> <!-- 数据溢出就隐藏 -->
        <div class="page-wrap"><!-- 滚动条 -->
        <!--1. 顶部标题字组件 -->
        <!-- Home .vue 入口全局组件 -->
            <!-- <title-bar :search="mysearch" :active="active"></title-bar>  -->
            <!--2. div保留48px 防止面板遮盖 -->
            <!-- <div style="height:60px"></div> -->
            <!-- 3.切换的面板列表 -->
            <mt-tab-container class="page-tabbar-container" v-model="active">
                <mt-tab-container-item id="index">
                   <index></index> <!--首页-->
                </mt-tab-container-item>
                <mt-tab-container-item id="movie">
                    <movie-list></movie-list> <!--详情-->
                </mt-tab-container-item>
                <mt-tab-container-item id="video">
                    <cinema></cinema><!-- <message-list></message-list> -->
                </mt-tab-container-item>
                <mt-tab-container-item id="show">
                    show<!-- <message-list></message-list> -->
                </mt-tab-container-item>
                <mt-tab-container-item id="me">
                   <me></me>
                </mt-tab-container-item>
            </mt-tab-container>
        
        <!-- 4.tabbar列表 -->
        <mt-tabbar v-model="active" fixed>
            <mt-tab-item id="index" @click.native="change(0)">
                <tabBarIcon :selectedImage="require('../assets/icon1.png')" :normalImage="require('../assets/icon01.png')" :focused="currentIndex[0].isSelect"></tabBarIcon>
                <span class="normal" :class="{selcolor:currentIndex[0].isSelect}">首页</span> 
            </mt-tab-item>
            <mt-tab-item id="movie" @click.native="change(1)">
                <tabBarIcon :selectedImage="require('../assets/icon2.png')" :normalImage="require('../assets/icon02.png')" :focused="currentIndex[1].isSelect"></tabBarIcon>
                <span class="normal" :class="{selcolor:currentIndex[1].isSelect}">电影</span>
            </mt-tab-item>
            <mt-tab-item id="video" @click.native="change(2)">
                <tabBarIcon :selectedImage="require('../assets/icon3.png')" :normalImage="require('../assets/icon03.png')" :focused="currentIndex[2].isSelect"></tabBarIcon>
                <span class="normal" :class="{selcolor:currentIndex[2].isSelect}">影院</span>
            </mt-tab-item>
            <mt-tab-item id="show" @click.native="change(3)">
                <tabBarIcon :selectedImage="require('../assets/icon4.png')" :normalImage="require('../assets/icon04.png')" :focused="currentIndex[3].isSelect"></tabBarIcon>
                <span class="normal" :class="{selcolor:currentIndex[3].isSelect}">演出</span>
            </mt-tab-item>
            <mt-tab-item id="me" @click.native="change(4)" class="normalfont">
                <tabBarIcon :selectedImage="require('../assets/icon5.png')" :normalImage="require('../assets/icon05.png')" :focused="currentIndex[4].isSelect"></tabBarIcon><span class="normal" :class="{selcolor:currentIndex[4].isSelect}">我的</span>
            </mt-tab-item>
        </mt-tabbar>
        
        </div>
    </div>
</template>


//在模块中调用
<script>
// 引入子组件
// import titleBar from "./tpp/titleBar.vue";
import tabBarIcon from "./tpp/tabBarIcon.vue";
import index from "./tpp/common/index.vue"
import movieList from "./tpp/common/movieList.vue";
import me from "./tpp/common/me.vue"
import cinema from "./tpp/common/cinema.vue"
export default {
    data(){return{
        active:"index",
        //创建数组保留图片的焦点状态
        currentIndex:[
            {isSelect:true},
            {isSelect:false},
            {isSelect:false},
            {isSelect:false},
            {isSelect:false}
        ]
    }},
    components:{tabBarIcon,index,movieList,cinema,me},
    methods:{
        change(n){
            for(var i=0;i<this.currentIndex.length;i++){
                this.currentIndex[i].isSelect=false;
                }
            this.currentIndex[n].isSelect=true;
            window.scrollTo(0,0)  //
            },
        mysearch(){}
    }
        
}
//注册子组件

</script>
<style scoped>
    .page-tabbar{overflow: hidden;}
    .page-wrap{
        overflow:auto;
         padding-bottom: 28px; 
         background:#fff;
    }
    .normal{color: #555}
    .selcolor{color:#FF627F}
    .mint-tabbar.is-fixed{
        background:#fff;
    }
</style>
