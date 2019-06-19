<template>
<!-- 入口组件  负责调用子组件 -->
    <div class="page-tabbar"> <!-- 数据溢出就隐藏 -->
        <div class="page-wrap"><!-- 滚动条 -->
        <!--1. 顶部标题字组件 -->
        <!-- Home .vue 入口全局组件 -->
            <title-bar :leftTitle="leftTitle" :search="mysearch" :add="myadd" :rightFirstImg="require('../../assets/ic_search.png')" :rightSecondImg="require('../../assets/ic_add.png')"></title-bar> 
            <!--2. div保留48px 防止面板遮盖 -->
            <div style="height:48px"></div>
            <!-- 3.切换的面板列表 -->
            <mt-tab-container class="page-tabbar-container" v-model="active">
                <mt-tab-container-item id="message">
                    <message-list></message-list>
                </mt-tab-container-item>
            </mt-tab-container>
        
        <!-- 4.tabbar列表 -->
        <mt-tabbar v-model="active" fixed>
            <mt-tab-item id="message" @click.native="change(0)">
                <tabBarIcon :selectedImage="require('../../assets/ic_weixin_selected.png')" :normalImage="require('../../assets/ic_weixin_normal.png')" :focused="currentIndex[0].isSelect"></tabBarIcon>微信
            </mt-tab-item>
            <mt-tab-item id="contact" @click.native="change(1)">
                <tabBarIcon :selectedImage="require('../../assets/ic_contacts_selected.png')" :normalImage="require('../../assets/ic_contacts_normal.png')" :focused="currentIndex[1].isSelect"></tabBarIcon>通讯录
            </mt-tab-item>
            <mt-tab-item id="find" @click.native="change(2)">
                <tabBarIcon :selectedImage="require('../../assets/ic_find_selected.png')" :normalImage="require('../../assets/ic_find_normal.png')" :focused="currentIndex[2].isSelect"></tabBarIcon>发现
            </mt-tab-item>
            <mt-tab-item id="me" @click.native="change(3)">
                <tabBarIcon :selectedImage="require('../../assets/ic_me_selected.png')" :normalImage="require('../../assets/ic_me_normal.png')" :focused="currentIndex[3].isSelect"></tabBarIcon>我的
            </mt-tab-item>
        </mt-tabbar>
        
        </div>
    </div>
</template>


//在模块中调用
<script>
// 引入子组件
import titleBar from "./common/titleBar.vue";
import messageList from "./common/messageList.vue";
import tabBarIcon from "./common/tabBarIcon.vue"
export default {
    data(){return{
        leftTitle:"微信(11)",
        active:"message",
        //创建数组保留图片的焦点状态
        currentIndex:[
            {isSelect:true},
            {isSelect:false},
            {isSelect:false},
            {isSelect:false}
        ]
        
     }},
    components:{
        titleBar,// "titlebar":titleBar
        messageList,
        tabBarIcon,
    },
    methods:{
        mysearch(){console.log("搜索")},
        myadd(){console.log("+")},
        change(n){
            for(var i=0;i<this.currentIndex.length;i++){
                this.currentIndex[i].isSelect=false;
                }
            this.currentIndex[n].isSelect=true;
            
            }
    }
}
//注册子组件

</script>
<style scoped>
    .page-tabbar{overflow: hidden;}
    .page-wrap{
        overflow:auto;
        padding-bottom: 46px;
    }
    /*修改tabbar默认颜色*/
    .mint-tabbar>.mint-tab-item{color:#999}
    .mint-tabbar > .mint-tab-item.is-selected{
        background-color:transparent;
        color: #45c018;}
</style>
