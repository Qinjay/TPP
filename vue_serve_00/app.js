const express=require('express');
const bodyParser=require('body-parser');
const userRouter=require('./user')

var server=express();
//5.跨域请求
const cors=require("cors");
server.use(cors({
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true
}));
//6.添加session功能 
    //引入session
const session=require("express-session")
  //配置模块
server.use(session({
    secret:"128位",//自定义字符串 将字符串通过加密生成128位字符串
    resave:true,//每次请求是否更新数据***
    saveUninitialized:true//保存初始化数据***
}))
server.listen(3000);
server.use(bodyParser.json());
server.use(express.static('public'));
server.use(bodyParser.urlencoded({
    extended:false
}));


server.use('/user',userRouter);