<template>
<div>
    <div class="pic">
        <div class="scroll" :style="{'margin-left':marginL+'px'}" @touchstart="touchstart" @touchmove="touchmove" @touchend="touchend">
            <div class="scrollImg" v-for="(item,i) of ticketMovieList" :key=i>
                <img :src="'/mymovie/'+item.mid+'.jpg'" alt="">
            </div>
        </div>
    </div>
    <div class="mtitle">
        <p>
            <span>蜘蛛侠：英雄远征</span>  
            <span>淘票票评分<span> 9.3</span></span>
        </p>
        <p>
            <span>120分钟</span>
            <span>动作</span>
            <span>主演</span>
        </p>
    </div>
    <div class="mdate">
        <p class="sel">今天<span>06-30</span></p>
        <p>明天<span>06-31</span></p>
        <p>后天<span>07-01</span></p>
    </div>
    <div class="openCard">
        <p>
            <span class="card">卡</span>
            <span>开通即可享受购票超值会员价</span>
        </p>
        <p>
            <span>30元开卡</span>
            <i class="iconfont icon-gengduo"></i>
        </p>
    </div>
    <div class="getSell">
        <p>
            <span class="sell">惠</span>
            <span>特惠抢票，名额有限抢完即止</span>
        </p>
        <i class="iconfont icon-gengduo"></i>
    </div>
    <div class="openTime" v-for="(item,i) of openList" :key="i">
        <div class="openleft">
            <div>
                <p class="start">{{item.sopen}}</p>
                <p>{{item.send}}散场</p>
            </div>
            <div>
                <p class="where">{{item.stype}}</p>
                <p>{{item.shose}}</p>
            </div>
        </div>
        <div class="openright">
            <div>
                <p class="price">特惠<span>{{item.sprice}}</span>元起</p>
                <p class="buyCard">影城卡32元起</p>
            </div>
            <div class="buy">
               <p>购票</p> 
            </div>
        </div>
    </div>
</div>
</template>
<script>
export default {
    data(){return{
        ticketMovieList:[],
        x1:0,
        x2:0,
        x3:0,
        xchange:0, //x 改变值 x3-x1
        marginL:0, //margin-left
        screenWidth:document.body.clientWidth,
        movieW:0,
        openList:[]
    }},
    created(){
        let params={isonload:1};
        this.axios.get("http://127.0.0.1:3000/user/unmovie",{params}).then(res=>{
            //console.log(res.data.data)
            this.ticketMovieList=res.data.data
        })
        this.axios.get("http://127.0.0.1:3000/user/start").then(res=>{
            console.log(res.data.data)
            this.openList=res.data.data
        })
        
    },
    methods:{
        touchstart(e){ //按下
            this.x1=e.touches[0].pageX;
        },
        touchmove(e){//移动
             this.movieW=this.screenWidth-(e.target.offsetWidth+10)*8;
                this.x2=e.touches[0].pageX;
                this.marginL=this.x2-this.x1+this.xchange; //margin-left
        },
        touchend(e){//抬起
            this.x3=e.changedTouches[0].pageX;
              this.xchange+=(this.x3-this.x1);
               this.marginL=this.xchange;
             if( this.marginL>0){ 
                  this.marginL=0;
                 this.xchange=0
                 }else if(this.marginL<this.movieW){ //img.width-window.innerWidth
                    this.marginL=this.movieW;
                    this.xchange=this.movieW
                 }else{
                this.marginL= this.marginL;
              }
        }
    },
}
</script>

<style scoped>
.pic{
    background:#be7575;
}
.scroll{
    display: -webkit-box;
    padding: 35px 13px 0;
    height: 135px;
    
}
    .scrollImg{
         width:70px; /*90*/
        height:100px;/*130*/
        margin:0 10px;
    }
    .scrollImg>img{width:100%;height:100%}
    .mtitle{text-align: center}
    .mtitle>p{
        font-size:16px;
        color: #000;
        margin-top:10px;
    }
    .mtitle>p+p{
        font-size:10px;
        color: #8f8f94;
        margin:10px;
    }
    .mdate{
        padding: 15px;
        height: 60px;
    }
    .mdate>p{
        float:left;
        width:33%;
        font-size:16px;
        color:#000;
        text-align: center;
        padding: 10px;
       
        }
    .mdate>p.sel{ border-bottom: 2px solid  #FF556F;}
    .openCard,.getSell{
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size:15px;
        padding: 10px;
    }
    .openCard{ background:#d7efd7;}
    .openCard>p{color:#80b980;}
    .openCard>p,.getSell>p{
        margin:0;
    }
    .getSell{border-bottom: 0.5px solid #ddd}
    .icon-gengduo{color:#8f8f94}
    .card,.sell{
        color:#fff;
        font-size:10px;
        padding:3px;
        border-radius: 3px;
        margin-right: 8px;
    }
    .card{ background:#80b980;}
    .sell{ background:#F6A553;}
    .openTime{
        border-bottom: 1px solid #ddd;
        padding:6px;
    }
    .openTime,.openleft,.openright{
        display: flex;
        justify-content: space-between;
        align-items: center;
        text-align: center;
    }
    .openTime p{
        margin:0;
        font-size:10px;
        line-height: 25px;
    }
    .openleft .start{
        font-size:18px;
        color:#000;
        font-weight: bold;
    }
    .where{color:#000}
    .openright p{
        color: #FF556F;
    }
    .openleft>div,.openright>div{margin-right: 10px;}
    .price>span{
        font-size:18px;
        color:#FF556F;
        font-weight: bold;
    }
    .openright>div>.buyCard{
        color:#80b980;
    }
    .buy{
       border: 1px solid #ff556f;
        padding: 0 9px;
        border-radius: 17px;
        text-align: center;
    }
    .buy>p{
        line-height: 24px;
    }
</style>

