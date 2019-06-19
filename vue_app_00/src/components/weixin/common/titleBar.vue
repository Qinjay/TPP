<template>
<!-- // 头文件组件 -->
    <div class="page-head">
        <!-- 顶部标题字组件 -->
        <span>{{leftTitle}}</span>
        <div class="right-head">
           <div class="searchdiv" @click="search"> 
               <img :src="rightFirstImg" alt="" style="width:25px">
           </div>
           <div class="searchdiv" style="margin-left:20px" @click="add">
               <img :src=" rightSecondImg" alt="" style="width:25px; margin-right:15px;">
           </div>
        </div>
    </div>
</template>

<script>
export default {
    name:"titleBar",
    data(){
        return {
           
        }
    },
    props:{
        leftTitle:{default:""},//左侧文字
        rightFirstImg:{default:""},//右侧图片1
        rightSecondImg:{default:""},//右侧图片2
         search:{type:Function},
         add:{type:Function}
        },
}
</script>
<style scoped>
    .page-head{
        display:flex;
        position: fixed;
        z-index:999;
        width:100%;
        justify-content: space-between;
        align-items: center;
        background-color:#3E3A39;
        padding-left:7px;
        padding-right:7px;
        height:48px;
        color:#fff;
        font-size:18px;
    }
    .right-head{
        display:flex;
    }
    .searchdiv{
        display: flex;
        align-items: center;
        height:48px;
    }
</style>
