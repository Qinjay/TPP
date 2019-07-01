<template>
    <div>
        <div class="top">
             <i class="iconfont icon-fanhui" @click="goback"></i>
            <span>{{cname}}</span>
        </div>
        <div id="container" :style="{'height':screenH+'px'}"></div>
    </div>
</template>
<script>
import {MP} from '../../../map.js'
export default {
    name:"bdmap",
    props:["cid"],
    data(){return{
        ak:"mgHU4gFz1EYGW6TXNLMbLCpoDquGGeat",
        screenH:window.innerHeight,
        ticketList:[],
        cname:'',
        mapx:0,
        mapy:0,
        madd:'',
    }},
    created(){
        let params={cid:this.cid}
        this.axios.get("http://127.0.0.1:3000/user/cinemadetail",{params}).then(res=>{
            this.ticketList=res.data.data[0];
            this.cname=this.ticketList.cname;
            this.mapx=this.ticketList.mapX;
            this.mapy=this.ticketList.mapY;
            this.madd=this.ticketList.address;
            console.log(this.ticketList)
        })
    },
    mounted(){
        this.$nextTick(function(){
            var _this = this;
            MP(_this.ak).then(BMap => {
                var map=new BMap.Map("container");
                var point=new BMap.Point(this.mapx,this.mapy);
                map.centerAndZoom(point,16);
                window.map=map;
                var ctrl_nav = new BMap.NavigationControl();  //缩放控件 
                map.addControl(ctrl_nav);
                var marker = new BMap.Marker(point);        // 创建标注    
                map.addOverlay(marker); 
                var opts = {    
                    width : 50,     // 信息窗口宽度    
                    height: 10,     // 信息窗口高度   
                    title : this.cname  // 信息窗口标题  
                } 
                var infoWindow = new BMap.InfoWindow(this.madd, opts);  
                // 创建信息窗口对象    
                map.openInfoWindow(infoWindow, map.getCenter());   //打开窗口信息  
            })
        })
    },
    methods:{
        goback(){
            this.$router.go(-1)
            //window.location.href
        }
    }


}
</script>
<style>
.BMap_bubble_content{font-size:10px;color:#8f8f94}
.BMap_bubble_title{font-size:15px;}
.top{
    position: fixed;
    top:0;
    left:0;
    width:100%;
    display: flex;
    justify-content:flex-start;
    align-items: center;
    padding:15px;
    font-size:20px;
    background:#fff;
    z-index: 999;
}
.top>i.icon-fanhui{font-size:20px}
.top>span{margin:0 auto;}
    #container{
        width:100%;
        
        /* border:1px solid #f00; */
    }
</style>

