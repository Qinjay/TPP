<template>
    <div>
        <div class="top">
            <div class="topInout">
                <input type="text" placeholder="搜索影院" v-model="value" > <i class="iconfont icon-sousuo" @click="selCinema"></i>
            </div>
        </div>
        <div style="width:100%;height:67px"></div>
        <div>
            <router-link  class="cinemaList" v-for="(item,i) of cinemaList" :key="i" :to="`/ticket/${item.cid}`" >
                <div class="cinemaListLeft">
                    <p>
                        <span class="cname">{{item.cname.slice(0,11)}} <span v-show="item.cname.length>11">...</span></span>
                        <span class="stext">好评度</span>
                        <span class="mscore">{{item.mscore}}%</span>
                    </p>
                    <p class="maddress">{{item.address}}</p>
                    <p class="mlabel">
                        <span v-show="item.isCard==1">影城卡</span>    
                        <span v-show="item.isRefund==1">退票</span>
                        <span v-show="item.isTicket==1">改签</span>
                        <span v-show="item.isIMAX==1">IMAX厅</span>
                        <span v-show="item.isMPOS==1">刷卡</span>
                        <span v-show="item.isFood==1">观影小食</span>
                    </p> <!--服务-->
                    <p v-show="item.msell"><span class="msell">惠</span> <span>{{item.msell}}</span></p>
                </div>
                <div class="cinemaListRight">
                    <p class="mdis">
                        <span>{{item.mdis}}</span>
                        <span>元</span>起
                    </p>
                </div>
            </router-link> 
            <!-- <div style="height:27px"></div> -->
        </div>
        <div @click="loadMore" class="loadbtn">{{btnText}}</div>
        
    </div>
</template>

<script>
export default {
    data(){return{
        cinemaList:[],
        value:"",
        count:7,
        start:0,
        btnText:"点击加载更多"
    }},
    created(){
         this.loadMore()
    },
    methods:{
        loadMore(){
            this.start++;
            let params={start:this.start,count:this.count}
            this.axios.get("http://localhost:3000/user/cinema",{params}).then(result=>{             
               var rows =this.cinemaList.concat(result.data.data)
               if(result.data.data){
                    this.cinemaList=rows;
                    }else{
                        this.btnText="(╥╯﹏╰╥)ง没了~"
                    }
        })
        },
        selCinema(){
            let params={str:this.value}
            this.axios.get("http://localhost:3000/user/selC",{params}).then(result=>{
                if(result.data.code==400){
                    this.$toast({
                        message:`未找到与${this.value}相关影院`,
                        duration: 3000
                    })
                }else{
                    this.cinemaList=result.data.data;
                    console.log(result)
                }
            })
        }
    }
}
</script>

<style scoped>
.loadbtn{
    width:100%;
    color: #8f8f94;
    text-align: center;
    padding:10px;
}
    .top{
        position: fixed;
        top:0;
        left:0;
        width:100%;
        padding: 12px;
        background:#fff;
    }
    .topInout{
        border:1px solid #ddd;
        border-radius: 5px;
        width:100%;
        }
    .topInout>input{
        width:90%;
        outline: 0;
        border: 0;
        margin:0;
        font-size:15px;
    }
    .icon-sousuo{font-size: 20px;}
    .cinemaList{
        display: flex;
        justify-content: space-between;
        color:#8f8f94;
        padding: 12px;
        background: #fff;
        border-bottom: 1px solid #ddd;
    }
    .cinemaListLeft{
        width:85%;
    }
    .cinemaListLeft>p{margin:5px 0;font-size:10px}
    .cinemaListRight{width:18%}
    .cname{    
        font-size: 17px;
        color: #000;
    }
    .stext,.mscore{
        font-size: 10px;
        border: 1px solid #F6A553;
        padding: 0 4px;
    }
    .stext{
        color:#F6A553;
        margin-left:5px;
        border-top-left-radius:3px;
        border-bottom-left-radius: 3px;
        }
    .mscore{
        background:#F6A553;
        color:#fff;
         border-top-right-radius:3px;
        border-bottom-right-radius: 3px;
    }
    .maddress{
        margin:0
    }
    .mlabel>span{
        color: #007aff;
        border: 0.5px solid #a2c8f3;
        border-radius: 3px;
        padding: 2px 4px;
        margin: 0 3px;
    }
    .msell{
        background:#F6A553;
        color:#fff;
        font-size:10px;
        padding:3px 5px;
        margin-right: 5px;
    }
    .mdis{
        font-size: 10px;
    }
    .mdis>span{
        color: #FF556F;
    }
    .mdis>span:first-child{
        font-size:19px;
    }
</style>
