<template>
<div>
    <div class="movie-date" v-for="(item,i) of unMovies" :key="i">
        <div class="movie-date-top">
            <!-- <p>周二</p> -->
            <p>{{item.release_time.slice(6,7)}}月{{item.release_time.slice(8,10)}}日</p>
        </div>
        <div class="movie-date-bot">
            <a href="javascript:;" class="movie-dateImg">
                <img :src="'/mymovie/'+item.mid+'.jpg'" alt="">
            </a>
            <a href="javascript:;" class="moviedate-mid">
                <p class="mtitle">{{item.mtitle}}</p>
                <p><span class="myfont1">31.2</span>万人想看</p>
                <p>导演：{{item.mdirect}}</p>
                <p>主演：{{item.mstar}}</p>
            </a>
            <a href="javascript:;" class="wantWatch">想看</a>
        </div>
    </div>
</div>
</template>
<style>
.myfont1{
    font-weight: bold;
    color:#F6A553;
    font-size:16px;
    }
.movie-date{padding:13px;border-top: 1px solid #ddd;}
.movie-date::after{
    content: "";
    display: block;clear: both;
}
    .movie-date-bot>a{
        float: left;
    }
    .movie-date-bot>a:last-child{
        float:right;
        margin-top: 5%;
    }
    .movie-dateImg{
        width:25%;
    }
    .movie-dateImg>img{
        width:100%;
    }
    .moviedate-mid{
        padding-left: 10px;
        width:53%
    }
    .mtitle{
        font-size:22px;
        color: #000;
        margin-right: 4px;
    }
    .mtitle~p{
        margin:5px;
    }
    .wantWatch{
        width: 19%;
        text-align: center;
        line-height: 35px;
        color:#fff;
        font-size:17px;
        border-radius: 18px;
       background-image: linear-gradient(90deg, #FFDF62 0%, #FECD0F 100%);
    }
</style>
<script>
export default {
    data(){return{
        unMovies:[],
        isonload:0
    }},
    created(){
        // 表movie_list  isonload=0
        this.axios.get("http://localhost:3000/user/unmovie",{params:{isonload:this.isonload}}).then((data)=>{
             this.unMovies=data.data.data
            // console.log( this.unMovies)
        })
    },
}
</script>

