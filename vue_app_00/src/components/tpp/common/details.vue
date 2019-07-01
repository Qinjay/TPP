<template>
    <div>
        <div class="detailVideo" @click="Vplay()">
            <video src="x.mp4" :controls=isPlay></video>
            <img src="bofang.png" alt="" v-show="!isPlay">
        </div>
        <div class="movieDetail">
            <div class="movieInfo">
                <div class="movieImg">
                    <img src="movied/1291561.jpg" alt="">
                    <span>IMAX3D</span>
                </div>
                <div class="movieCom">
                    <p class="mtitle">{{rows.title}}</p>
                    <p>{{rows.original_title}}</p>
                    <p class="minfo" >
                        <span v-for="(item,i) of rows.genres" :key="i">{{item}}/</span>
                        <span >{{country}}/</span>
                        <span>{{duration}}</span> </p>
                    <p class="onmovie">{{rows.mainland_pubdate}} 在中国大陆上映</p>
                    <div class="mwant">
                        <p><span class="myfont">3.9万</span>人想看</p>
                        <p><span class="myfont">65%</span>大V推荐</p>
                    </div>
                </div>
            </div>
            <div class="mscore">
            <span class="score">{{score}}</span><span v-for="(n,i) of grade" :key="i"><img src="xingxing.png" alt=""></span><span v-for="(n,i) of 5-grade" :key="i"><img src="xingxing01.png" alt=""></span>
            </div>
        </div>
        <div class="movieDetails">
            <div style="width:100%;height:48px;" v-show="isTop"></div>
            <ul :class="{nevUl:isTop}">
                <li :class="{sel:sel[0].isSel}" ><a href="javascript:;">简介</a> </li>
                <li :class="{sel:sel[1].isSel}" @click="Dscroll2"><a href="javascript:;">视频</a> </li>
                <li :class="{sel:sel[2].isSel}" @click="Dscroll3"><a href="javascript:;">讨论</a></li>
                <li :class="{sel:sel[3].isSel}" ><a href="javascript:;">更多</a></li>
            </ul>
            <detail-mintro :Mdatail=mintro></detail-mintro> 
            <detail-casts :Mcasts=mcasts></detail-casts><!--演职人员-->
            <detail-trailer :Traile=trailer></detail-trailer><!--视频-->
            <detail-photos :Photos=photos></detail-photos><!--剧照-->
            <detail-reviews :Reviews=reviews ref="reviews" ></detail-reviews>
        </div>
        <router-link to="/ticket/1" class="buyTicket">选座购票</router-link>
        <div class="goback" :style="{'opacity':opacity}">
            <i class="iconfont icon-fanhui" @click="goIndex"></i>
            <div class="topmid">
                <p>{{rows.title}}</p>
                <p>{{rows.original_title}}</p>
            </div>
            <i class="iconfont icon-fenxiang"></i>
        </div>

    </div>
</template>
<script>
import detailMintro from "./details/detail_mintro.vue"
import detailCasts from "./details/detail_casts.vue"
import detailTrailer from "./details/detail_trailer.vue"
import detailPhotos from "./details/detail_photos.vue"
import detailReviews from "./details/detail_reviews.vue"
        

export default {
    data(){return{
        top:0,
        sel:[
            {isSel:true},
            {isSel:false},
            {isSel:false},
            {isSel:false},
            ],
        isTop:false,
        isPlay:false,
        scrolltop:0,
        opacity:0,
        rows:[],
        score:0,
        grade:0,
        mintro:"",
        mcasts:[], //主演
        trailer:'',  //预告片
        photos:[],//剧照
        reviews:[],//热评
        country:"",//国家
        duration:""
    }},
    props:["mid"],
    created(){
        console.log("接收的到商品id为:"+this.mid)
       // var url="http://api.douban.com/v2/movie/subject/1291561?apikey=0df993c66c0c636e29ecbb5344252a4a"
        var url="../../1291561.json"
        this.axios.get(url).then((result)=>{
            this.rows=result.data
            this.score=this.rows.rating.average
            this.grade=Math.round(( this.score)/2);
            this.mintro=this.rows.summary.slice(0,-3);
            this.mcasts=this.rows.casts;
            this.trailer=this.rows.trailer_urls;
            this.photos=this.rows.photos;
            this.reviews=this.rows.popular_reviews;
            this.country=this.rows.countries[0];
            this.duration=this.rows.durations[0]
            //  console.log(this.rows.popular_reviews);
        })
    },
    mounted(){
        window.addEventListener("scroll",this.handleScroll)
    },

    methods:{
        show(i){
            for(var key of this.sel){
                key.isSel=false;
            }
            this.sel[i].isSel=true;
        },
        Vplay(){
            this.isPlay= this.isPlay== true ? false : true;
        },
        handleScroll(){
            this.scrolltop=window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
            this.opacity=this.scrolltop/45;
            // console.log(this.scrolltop)
            if(this.scrolltop>=380){
                this.isTop=true
            }else{
                this.isTop=false;
            }
        },
        goIndex(){
            this.$router.go(-1)
        },
        Dscroll3(){
            window.scrollTo(0,1200);
        },
        Dscroll2(){
            window.scrollTo(0,750);
        }
    },
    components:{detailMintro,detailCasts,detailTrailer,detailPhotos,detailReviews}
}
</script>


<style scoped>
.movieDetails .nevUl{
    position: fixed;
    top: 45px;
    left: 0;
    background: #fff;
    width: 100%;
    padding: 16px 28px;
    }
    .myfont{
        font-size: 18px;
        color: #000;
        margin: 13px 0;
    }

    
    .detailVideo{
        width:100%;
        position: relative;
    }
    .detailVideo>video{
        width:100%
    }
    .detailVideo>img{
        position: absolute;
        top: 38%;
        left: 44%;
        width: 12%;
    }
    .movieDetail{ padding: 13px;background: #fff;}
    .movieInfo{
        display: flex;
        
    }
    .movieImg{
        width:20%;
        position: relative;
        /* flex: 1; */
        border-radius: 3px;
        overflow: hidden;
    }
    .movieImg>img{
        width:100%;
    }
    .movieImg>span{
        position: absolute;
        top:1%;
        left:1%;
        background:#ddd;
        font-size:10px;
        border-radius: 4px;
        line-height: 12px;
        padding: 3px;
    }
    .movieCom{padding-left: 10px;}
    .movieCom>p{
        margin:5px 0;
        font-size:14px;
    }
    .movieCom .mtitle{
        font-size:18px;
        color:#000;
        font-weight: 600;
    }
    .myfont{
        font-size:16px;
        color:#000;
    }
    .mwant{
        display: flex;
       
    }
    .mwant>p{ margin-right: 15px;}
    .score{
        font-size: 30px;
        font-weight: 600;
        margin-right: 10px;
    }
    .mscore{
        margin: 10px 10px 0;
    }
    .movieDetails{
        padding: 13px;
        background:#fff;
    }
    .movieDetails>ul{
        display: flex;
        justify-content: space-between;
        padding: 15px;
        border-bottom: 1px solid #eee;
    }
    li.sel:after{
        content: "";
        display: block;
        width: 55%;
        height:2px;
        background:#000;
        margin:0 auto;
    }
    .movieDetails>ul>li>a{color: #8f8f94;}
    .buyTicket{
        position: fixed;
        bottom: 0;
        width:100%;
        height:50px;
        color:#fff;
        font-size:20px;
        line-height:50px;
        text-align: center;
        background-image: linear-gradient(to right, #f28391 0%, #fa4f69 100%); 
    }
    .goback{
        position:fixed;
        top:0;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #fff;
        color:#000;
        height:45px;
        width:100%;
        opacity: 0;
        padding: 0 10px
    }
    .topmid{
        padding: 0px 10px;
    }
    .topmid>p{
        margin:0;
        color:#000;
        font-size:16px;
    }
    .topmid>p+p{
        color:#8f8f94;
        font-size:12px;
    }
</style>
