<template>
    <span  @click="add()"><i class="iconfont icon-dianzan"></i><span>{{n}}</span></span>
    
</template>
<script>
export default {
    data(){return{
        n:0
    }},
    methods:{
         add(){
            this.n++;
        }
    }
}
</script>
