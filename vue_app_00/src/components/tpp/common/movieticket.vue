<template>
    <div class="ticket">
        <div class="topfixed">
            <i class="iconfont icon-fanhui" @click="jump"></i>
            <span>{{cname.slice(0,11)}}<span v-show="cname.length>11">...</span> </span>
            <i class="iconfont icon-paihangbang"></i>
        </div>
        <div style="height:50px"></div>
        <div class="cinemaList">
            <div class="cinemaListLeft">
                <p>
                    <span class="cname">{{ticketList.cname}}</span>
                    <span class="stext">好评度</span>
                    <span class="mscore">{{ticketList.mscore}}%</span>
                </p>
                <p class="maddress">{{ticketList.address}}</p>
                <p class="mlabel">
                    <span v-show="ticketList.isCard==1">影城卡</span>    
                    <span v-show="ticketList.isRefund==1">退票</span>
                    <span v-show="ticketList.isTicket==1">改签</span>
                    <span v-show="ticketList.isIMAX==1">IMAX厅</span>
                    <span v-show="ticketList.isMPOS==1">刷卡</span>
                    <span v-show="ticketList.isFood==1">观影小食</span> 
                </p> <!--服务-->
            </div>
            <div class="cinemaListRight" @click="getMap">
                <i class="iconfont icon-ditu"></i>
            </div>
        </div>
        <div class="Tips">
            <div class="mCard">
                <p>影城卡</p>
                <p>开卡后购买更优惠</p>
            </div>
            <div class="mFood">
                <p>观影小食</p>
                <p>小食31.5元起</p>
            </div>
            <div class="mSell">
                <p>联合优惠专区</p>
                <p>银联运营商特惠</p>
            </div>
        </div>
        <!-- 影片 -->
        <pic-scroll></pic-scroll>
    </div>
</template>

<script>
import picScroll from './ticket/picscroll.vue'
export default {
    data(){return{
        ticketList:[],
        cname:"",
    }},
    props:["cid"],
    created(){
        let params={cid:this.cid}
        this.axios.get("http://127.0.0.1:3000/user/cinemadetail",{params}).then(res=>{
            this.ticketList=res.data.data[0];
            this.cname=this.ticketList.cname
        })
    },
    methods:{
        jump(){
            this.$router.push("/home");
        },
        getMap(){
           
             this.$router.push(`/cmap/${this.cid}`);
        }
    },
    components:{picScroll}
}
</script>
<style scoped>
.ticket{background:#fff}
    .topfixed{
        position: fixed;
        width:100%;
        top:0;
        left: 0;
        display: flex;
        justify-content: space-between;
        padding: 13px;
        background:#fff;
    }
    .topfixed>.iconfont{font-size: 30px}
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
        color: #777;
        border: 0.5px solid #eee;
        border-radius: 3px;
        padding: 2px 4px;
        margin: 0 3px;
    }
    .cinemaListLeft{
        width:85%;
    }
    .cinemaListLeft>p{margin:5px 0;font-size:10px}
    .cinemaListRight{width:18%;text-align: right}
    .icon-ditu{
        font-size:45px;
        color:#FF556F;
    }
    .cinemaList{
        display: flex;
        justify-content: space-between;
        align-items: center;
        color:#8f8f94;
        padding: 12px;
        background: #fff;
        border-bottom: 1px solid #ddd;
    }
    .Tips{
        display: flex;
        flex-wrap: nowrap;
        justify-content: space-between;
        padding: 12px 0;
    }
    .Tips p{
        margin:0;
        line-height:16px;
        }
    .mCard,.mFood,.mSell{
        width:100%;
        height:50px;
        border-radius: 5px;
        text-align: center;
        padding: 5px 0;
        margin:0 4px;
        font-size:12px;
    }
    .mCard{
        border:1px solid #80b980;
        background: #d7efd7;
    }
    .mCard>p{color:#80b980;}
    .mFood{
        border:1px solid #ff556fab;
        background: #ffdee7;
    }
    .mFood>p{color:#ff556fab}
    .mSell{
        border:1px solid #88c9fd;
        background: #8cd1ff54;
    }
    .mSell>p{color:#88c9fd}
</style>
