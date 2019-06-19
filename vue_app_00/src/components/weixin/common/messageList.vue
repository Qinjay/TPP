<template>
    <div >
        <message class="itemstyle" v-for="(item,index) in datas.data" :key="index" :id="item.id" :imgurl="require('../../../assets/a_7.png')" :title="item.title" :subtitle="item.subtitle" :sendtime="item.time" :itemClick="itemClick"></message>

    </div>
</template>
<script>
import message from "./message"
import messagejson from "../json/messagelist.json"
export default {
    data(){return{datas:messagejson}},
    methods:{ 
        itemClick(id){console.log(id)}
        },
    components:{message}
}
</script>
<style scoped>
    .itemstyle{
        padding:5px;
        border-bottom:1px solid #d9d9d9;
        background-color:#fff;
    }
</style>
