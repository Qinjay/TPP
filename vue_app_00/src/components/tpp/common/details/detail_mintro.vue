<template>
   <div class="mintro">
       <span v-show="!isShow">{{Mdatail.slice(0,60)}}</span>
       <span v-show="isShow">{{Mdatail}}</span>
       <span class="more" @click="getMore" v-show="!isShow">更多</span>
</div>
     
</template>
<script>
export default {
    data(){return{}},
    props:{
        Mdatail:"",
        isShow:false
        },
  
    methods:{
        getMore(){
            this.isShow=true;
        }
    },
}
</script>

<style scoped>
    .mintro{
        font-size: 14px;
        color: #000;
        line-height: 25px;
        padding: 15px 0;
        border-bottom: 1px solid #eee;
    }
    .more{
        color:#007aff;
        background:#fff;
        margin: 5px;
        box-shadow: -5px 0px 21px 5px #fff;
        padding: 3px;
    }
</style>
