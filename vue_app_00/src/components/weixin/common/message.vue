<template>
    <div class="rootstyle" @click="itemClick(id)">
        <!-- <h3>message.vue 消息组件</h3> -->
        <div class="leftimgandlablestyle">
            <img :src="imgurl" alt="" class="imgstyle">
            <div class="rightOfImg">
                <span class="titleable">{{title}}</span>
                <span class="subtitle">{{subtitle}}</span>
            </div>
        </div>
        <span class="sendtime">{{sendtime}}</span>
    </div>
</template>
<script>
export default {
    data(){return{}},
    props:{
        id:{default:""},
        imgurl:{default:""},
        title:{default:"",type:String},
        subtitle:{default:"",style:String},
        sendtime:{default:"",style:String},
        itemClick:{type:Function}
    },
}
</script>
<style scoped>
    .rootstyle{
        display:flex;
        justify-content: space-between;
        /* padding:5px; */
        }
    .leftimgandlablestyle{
        display:flex;
        align-items: center;
        }
    .imgstyle{width:50px;height:50px;}
    .rightOfImg{
        display: flex;
        flex-direction: column;
        justify-content:center;
        margin-left:7px;
        }
        .titleable{
            color:#000;
            font-size:17px;
        }
        .subtitle{
            color:gray;
            margin-top:4px;
        }
        .sendtime{
            color:gray;
            align-self: flex-start;/*定义元素在纵轴的对其方式 容器的开头*/
            }
</style>
