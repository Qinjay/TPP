<template>
    <div>
        <div class="detailVideo">
            <video src="x.mp4"></video>
            <img src="bofang.png" alt="">
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
                        <span v-for="(elem,n) of rows.countries" :key="n">{{elem}}/</span>
                        <span  v-for="(elem,m) of rows.durations" :key="m">{{elem}}</span> </p>
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
            <ul>
                <li><a href="javascript:;">简介</a> </li>
                <li><a href="javascript:;">影评</a> </li>
                <li><a href="javascript:;">讨论</a> </li>
                <li><a href="javascript:;">更多</a> </li>
            </ul>
            <detail-mintro :Mdatail=mintro></detail-mintro>
            <detail-casts></detail-casts>
            
        </div>
 <!--演职人员-->

 <!--视频-->
        <div>
            <p>视频</p>
            <div>
                <video src="x.mp4"></video>
            </div>
            <p>全部12个视频</p>
        </div>
 <!--剧照-->
        <div>
            <p>剧照</p>
            <div><img src="hyr02.jpg" alt=""></div>
             <p>全部186张剧照</p>
        </div>
 <!--影评-->      
        <div>
            
        </div>

    </div>
</template>
<script>
import detailMintro from "./details/detail_mintro.vue"
import detailCasts from "./details/detail_casts.vue"
export default {
    data(){return{
        rows:[],
        score:0,
        grade:0,
        mintro:""
    }},
    created(){
       // var url="http://api.douban.com/v2/movie/subject/1291561?apikey=0df993c66c0c636e29ecbb5344252a4a"
        var url="../../1291561.json"
        this.axios.get(url).then((result)=>{
            this.rows=result.data
            this.score=this.rows.rating.average
            this.grade=Math.round(( this.score)/2);
            // 
            this.mintro=this.rows.summary.slice(0,-3)
            // console.log(this.rows,this.mintro);
        })
    },
    components:{detailMintro,detailCasts}
}
</script>


<style scoped>
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
    .movieDetails>ul>li>a{color: #8f8f94;}
    
</style>
