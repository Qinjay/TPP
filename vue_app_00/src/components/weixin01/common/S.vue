<template>
    <div class="sclass">
        <h3>子组件</h3>
        <span>{{meg}}</span>
        <img :src="img_url" alt="">
        <button @click="add">点击事件</button>
    </div>
</template>

<script>
export default {
    name:"S",//子组件的名字
    props:{//接收父组件数据
        meg:{default:""},//meg默认字符串
        img_url:{default:""},//默认字符串
        add:{type:Function}//函数
    },
    data(){return{

    }},

}
</script>
<style scoped>
    .sclass{
        background-color:#000;
    }
    .sclass>span{color:#fff};
    .sclass>img{width:30px;height:30px}
</style>
