<template>
    <div>
        <h3>父组件</h3>
        <ss meg="微信(11)" :img_url="require('../../assets/ic_search.png')" :add="myadd"></ss>

    </div>
</template>

<script>
//引入子组件   注册  调用  传值
import S from "./common/S";

export default {
    data(){return{}
    },
    methods:{
        myadd(){
            console.log("+")
        }
    },
    components:{ "ss":S}, //ss子组件标签名称
}
</script>
