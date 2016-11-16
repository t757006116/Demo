<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>京东(JD.COM)-综合网购首选-正品低价、品质保障、配送及时、轻松购物！</title>
		<link rel="shortcut icon" href="jd.ico" type="image/x-icon">
		<style type="text/css">
		*{
				margin: 0px;  /*外边距*/
				padding: 0px;/*内边距*/
				font-size: 12px;/*字体大小*/
				color: #666;/*颜色*/
				font-family: '微软雅黑'；/*字体样式*/
		}
		a{
			text-decoration: none;
		
		}
		a:HOVER{
		color:#c81623;
		}
		#top{
				width: 100%;
				height: 30px;
				background-color: #f1f1f1;
			   /*  border:1px solid red;/*边框*/ */
				margin: 0px auto;/*居中*/
		}
		#top>ul>li{
				height: 30px;
				line-height: 30px;/*行高*/
				float: left;/*左浮动*/
				list-style: none;/*去点 列表符号样式*/
		
		}
		/*筛选偶数项的li，2n/even为偶数，2n+1/odd为奇数*/
		#top>ul>li:nth-child(2n){
				width: 30px;
				text-align: center;/*居中*/
				color: #dddddd;
		}
		#top>ul>li:nth-child(2n+1){
				width: 80px;
				text-align: center;
		}
		#chosecity{
				
				width: 100px;
				border-bottom: 0px;/*下边框*/
				border:1px solid #f1f1f1;
				border-bottom: 0px;
		}
		/*伪类hover，即鼠标放上去的效果*/
		#chosecity:HOVER{
				background-color: white;
				border: 1px solid #dddddd;
				border-bottom: 0px;
		}
		/*伪类hover，即鼠标放上去改变指定节点的样式*/
		#chosecity:HOVER #allcity{
				border-top: 0px;
				display: block;
		}
		#allcity{
				width: 300px;
				height: 180px;
				border: 1px solid #dddddd;
				display: none;/*隐藏*/
				background-color: white;
				
		}
		#allcity>li{
				width: 55px;
				height: 30px;
				float: left;
				line-height: 35px;
				margin-left: 5px;
				list-style: none;
				cursor: pointer;/*将光标改为手型*/
		}
		#allcity>li:HOVER {
				background-color: #c81623;
				color: white;
		}
		#gzjd_ewm{
				width: 82px;
				height: 97px;
				border: 1px solid #dddddd; 
				display: none;/*隐藏*/
				border-bottom: 0px; 
				/* border-top: 0px; */
		}
		#gg{
				width: 100%;
				height:80px;
				/* border: 1px solid red; */
				background-color: #29e7a7;
		}
		#gg>div{
				width:1000px;
				height:80px;
				background: url("images1/57eb32d9N36c255ff.jpg"); 
				background-repeat:no-repeat;/*取消平铺*/
				background-position: center;/*背景图片为居中*/
				/* border: 1px solid red; */
				margin: 0px auto;
		}
		#gg input{
				width: 19px;
				height: 19px;
				background:url("images1/5507956eN735de046.png");
				float: right;
				margin-top:10px;
				margin-right: 20px;
				border: 0px;
				outline: none;/*内边框*/
				background-position: 0px 0px; /*背景偏移*/
		}
		#gg input:HOVER {
				background-position: 0px -19px;
		}
		#logo{
				width: 1100px;
				height: 90px;
				margin: 0px auto;
				/* border: 1px solid red; */
				background:url("images1/logo-201305.png");
				background-repeat: no-repeat;
				background-position: 10px 20px;
		
		}
		#logo_search{
				width: 450px;
				height: 30px;
				border: 2px solid #b61d1d;
				margin-left: 400px;
				margin-top: 30px;
				float: left;
		}
		/*取input中的第一个节点元素*/
		#logo_search>input:FIRST-CHILD {
				width: 390px;
				height: 30px;
				border: 0px;
				outline: none;
				text-indent: 10px;/*首行缩进*/
				font-size: 14px;
		}
		#logo_search>input:last-child{
				width: 55px;
				height: 30px;
				border: 0px;
				outline: none;
				background-color: #b61d1d;
				color: white;
				float: right;
		}
		#logo_car{
				width: 130px;
				height: 30px;
				float: right;
				margin-top:30px;
				border: 1px solid #dddddd;
				margin-right: 40px;
				background: url("images1/jd2015img.png");
				background-color: #f1f1f1;
				background-position: 15px -50px;
				background-repeat: no-repeat; 
				line-height: 31px;
				text-indent:  40px;
				/*相对定位：根据自身位置定位，保留原先位置*/
				position:relative;
				cursor: pointer;
				
		}
		#logo_car>div{
				clear: both;
				width: 15px;
				height: 15px;
				background-color: #b61d1d;
				color: white;
				text-indent:4px;
				line-height:15px;
				/*绝对定位：根据有定位的父节点定位。不保留原来位置*/
				position: absolute;
				top: -5px;
				left: 100px;
				/*边角圆弧*/
				border-radius: 10px 10px 10px 0px;
				
		}
		#logo_con{
				width: 450px;
				height: 25px;
				line-height: 25px;
				/* border: 1px solid red; */
				float: left;
				margin-left:400px; 
		
		}
		#logo_con:HOVER{
				
				cursor: pointer;
		}
		
		#menu{
				width: 100%;
				height: 50px;
				border-bottom: 2px solid #b1191a;
		
		}
		#menu>ul {
				width: 1100px;
				height: 50px;
				/* border: 1px solid red; */
				margin: 0px auto;
		}
		#menu>ul>li {
				width: 80px;
				height: 50px;
				line-height: 50px;
				text-align: center;
				float: left;
				font-size: 14px;
				color: black;
				list-style: none;
		}
		/*nth-child(1)和first-child作用相同*/
		#menu>ul>li:nth-child(1){
				width: 200px;
				background-color: #B1191a;
				color: white;
				text-align: left;
				text-indent: 10px;
				cursor: pointer;
		}
		
		#menu a{
				font-size: 14px;
				color: black;
		}
		#menu a:HOVER {
				color: #c81623;
		}
		#content{
				width: 1100px;
				height: 470px;
				/* border: 1px solid red; */
				margin: 0px auto;
		}
		.content_left{
				width: 200px;
				height: 470px;
				/* border: 1px solid #c81623; */
				float: left;
		}
		.content_left>ul{
				width: 200px;
				height: 470px;
				/* border: 1px solid orange; */
		}
		.content_left>ul>li{
				width: 200px;
				height: 31.3px;
				background-color: #c81623;
				color: white;
				font-size: 14px;
				text-indent: 5px;
				cursor: pointer;
				line-height: 31.3px;
				list-style: none;			
		}
		.content_left>ul>li:HOVER{
				background: white;
				color: #c81623;
				border-left: 1px solid #c81623;
		}
		.content_middle{
				width: 680px;
				height: 470px;
				float: left;
				margin-top: 10px;
				margin-left: 10px;
				margin-bottom: 10px;
		}
		.content_right{
				width: 200px;
				height: 470px;
				/* border: 1px solid blue; */
				float: left;
				margin-top:10px;
				margin-left: 10px; 
		}
		.content_right_con{
				width: 210px;
				height: 170px;				
				/* border: 1px solid #dddddd; */
				border-left: 1px solid #dddddd;
				border-top: 1px solid #dddddd;
		}
		.content_right_con>li{
				width: 210px;
				height: 25px;
				line-height: 25px;
				list-style: none;
				text-indent: 15px;
		}
		.content_right_con>li:FIRST-CHILD {
				height: 35px;
				line-height: 35px;
				font-size:16px;
				
				border-bottom: 1px solid #dddddd;
				
		}
		.content_right p{
				float: right;
				line-height: 35px;
				margin-right: 10px;
		}
		.content_right p:HOVER {
				color: #c81623;
				cursor: pointer;
		}
		.content_right_12img{
				width: 210px;
				height: 180px;
				border-top: 1px solid #dddddd;
		}
		.content_right_12img li{
				width: 51px;
				height: 59px;
				border: 1px solid #dddddd;
				border-right:0px;
				border-top:0px;
				float: left;
				list-style: none;
				line-height: 30px;
				text-align: center;
		}
		.content_right_12img div{
				width: 25px;
				height: 25px;
				/* border: 1px solid #c81623; */
				margin: 0px auto;
				margin-top: 10px;
				background-image: url("images1/57620a6fN77b2b8af.png");
		}
		.content_right_12img>li:nth-child(2) div{
				background-position: 0px -25px;
		}
		.content_right_12img>li:nth-child(3) div{
				background-position: 0px -50px;
		}
		.content_right_12img>li:nth-child(4) div{
				background-position: 0px -75px;
		}
		.content_right_12img>li:nth-child(5) div{
				background-position: 0px -100px;
		}
		.content_right_12img>li:nth-child(6) div{
				background-position: 0px -125px;
		}
		.content_right_12img>li:nth-child(7) div{
				background-position: 0px -150px;
		}
		.content_right_12img>li:nth-child(8) div{
				background-position: 0px -175px;
		}
		.content_right_12img>li:nth-child(9) div{
				background-position: 0px -200px;
		}
		.content_right_12img>li:nth-child(10) div{
				background-position: 0px -225px;
		}
		.content_right_12img>li:nth-child(11) div{
				background-position: 0px -250px;
		}
		.content_right img{
				margin-top:10px; 
				cursor: pointer;
		}
		#ttrm{
				width: 1100px;
				height: 320px;
				/* border: 1px solid red; */
				margin: 0px auto;
				margin-top: 20px;
				
		}
		#ttdj{
				width: 750px;
				height: 320px;
				/* border: 1px solid red; */
				float: left;
		}
		#ttdj>p,#rmtj>p{
				width: 750px;
				height: 40px;
				line-height: 40px;
				font-size: 20px;
		}
		
		#ttdj>table {
				width: 750px;
				height: 280px;
				
		}
		#ttdj table tr td{
				width: 250px;
		}
		.shop_bigimg{
				margin-left: 50px;
				position: relative;
				top: 0px;
				left: 10px;
				width:160px;
				height:160px;
				transition:left 1s;/*过渡：过渡属性过渡时间  transform 1s 旋转 */
				cursor: pointer;
		}
		.shop:HOVER .shop_bigimg{
				left: -20px;
				
				/*transform: rotate(180deg); 旋转180度*/
		}
		
		.shop>p{
				margin-left: 30px;
		}
		.shop_bigimg2{
				margin-left: 20px;
				position: relative;
				
				left: 0px;
				transition:left 1s;/*过渡：过渡属性过渡时间  transform 1s 旋转 */
				cursor: pointer;
				float:left;
				
				
		}
		.shop2:HOVER .shop_bigimg2{
				left: -10px;
				
				/*transform: rotate(180deg); 旋转180度*/
		}
		.shop2>p{
				width: 100px;
				margin-right:10px;
				margin-bottom:20px;
				line-height: 20px;
				float: right;
				
		}
		
		.price{
				color: #e12228;
				font-size: 18px;
				height: 30px;
				line-height: 40px;
				font-weight: bolder;
				
				
		}
		#rmtj{
				width: 346px;
				height: 320px;
			/* 	border: 1px solid green; */
				float: left;
		}
		#wfgd{
				width: 346px;
				height: 278px;
				border: 2px solid #ededed;
				border-left: 0px;
				border-right: 0px;
				overflow: hidden;/*溢出*/
				
		}
		.wfgd_img{
				width: 346px;
				height:140px;
				margin-left: 20px;
				
		}
		#tm{
				width: 100%;
				height: 1100px;
				background: black;
				position: absolute;
				opacity:0.3;
				top: 0px;
				left: 0px;
				z-index: 9;
		}
		
		#Login{
				width: 500px;
				height: 250px;
				border: 2px solid #B1191A;
				position: absolute;
				z-index: 10;
				top: 260px;
				height: 200px;
				left: 34%;
				border-radius:10px; 
				background-image: url("images1/login_logo.png");
				background-color: white;
				background-repeat: no-repeat;
		}
		
		#Login table {
				width: 300px;
				height: 100px;
				margin: 90px 0px 0px 100px;
		}
		
		#Login td{
				font-size: 18px;
		}
		
		.sub{
				width: 80px;
				height: 30px;
				line-height: 30px;
				background: #CB1623;
				border: 0px;
				outline: none;
				color: white;
		}
		#backTop{
				width: 80px;
				height: 30px;
				background-color: #b1191a;
				color: white;
				line-height: 30px;
				text-align: center;
				text-indent:-40px;
				/*固定定位：根据浏览器定位*/
				position: fixed;
				right: -40px;
				bottom: 50px;
				opacity:0.8;/*透明度 */
				display: none;
		}
		</style>
		<script type="text/javascript" src="jquery-2.1.1.min.js"></script>
		<script src="https://cdn1.lncld.net/static/js/av-min-1.2.1.js">
		// 应用 ID，用来识别应用
		var APP_ID = '0tGJbqSGSmct1YgECqlT3Q98-gzGzoHsz';

		// 应用 Key，用来校验权限（Web 端可以配置安全域名来保护数据安全）
		var APP_KEY = 'L8V0sOY2yYyeIqarTNhGy4FV';

		// 初始化
		AV.init({
		  appId: APP_ID,
		  appKey: APP_KEY
		});
		</script>
		<script type="text/javascript">
		/*提示框*/
		$(function(){
			//滚动条触发事件
			$(window).scroll(function(){
				var top = $(document.body).scrollTop();
				if(top>100){
					$("#backTop").stop().fadeIn(1000);
				}else{
					$("#backTop").stop().fadeOut(1000);
				}
			});
			
			$("#backTop").hover(function(){
				$("#backTop").html("&nbsp&nbsp&nbsp回到顶部");
				$(this).stop().animate({"right":"0px"},500);
			},function(){
				$(this).stop().animate({"right":"-40px"},500,
						function(){
					$(this).html("↑Top");
				});
				
			});
			$("#backTop").click(function(){
				$(document.body).animate({"scrollTop":"0"},1000);
			});
			
			if(${msg==false}){
				//alert("登录失败！");
				//登录失败后将登录框继续显示
				$("#tm").show();
				$("#login").show();
			}
			if (${msg==true}) {
				alert("登录成功！");
			}
			$("#allcity>li").click(function(){
				var city = $(this).html();
				//改变city节点元素的内容
				$("#city").html(city);
			});
			//给指定节点元素绑定悬停事件
			$("#gzjd").hover(function () {
				//将二维码图片显示
				$("#gzjd_ewm").show();
				/* $("#gzjd_ewm").css({"display":"block"}); */
				$("#gzjd_ewm").css({"border-top":"0px;","display":"block"});
				$(this).css({"background-color":"while",
							 "border":"1px solid #dddddd",
							 "border-bottom":"0px"});
				},function(){
				//将二维码图片隐藏
					$("#gzjd_ewm").hide();
					$(this).css({"background-color":"#f1f1f1",
					 "border":"1px solid #f1f1f1"
						 });
					});
			
			$("#closegg").click(function () {
				//隐藏
				//$("#gg").hide();
				//窗帘效果
				//$("#gg").slideUp(2000);
				//淡出效果
				$("#gg").fadeOut(500);
				});
			
			$("#lg").click(function(){
				$("#tm").fadeIn(500,function(){
					$("#Login").fadeIn(500);
				});
			});
			
			$("#tm").click(function(){
				$("#Login").fadeOut(200,function(){
					$("#tm").fadeOut(200);
				});
	
			});
		});
		//定时器
		setInterval("changeImg()", 2000);
		//显示第几张
		var index = 2;
		//轮流显示图片
		function changeImg() {
			//改变图片显示隐藏
			for(var i=1;i<6;i++){
				//
				if (index == i) {
					//将图片淡进显示
					$("#img"+i).fadeIn(2000);
					
				}else{
					//将其他图片隐藏
					$("#img"+i).hide();
				}
				
			}
			index++;
			//如果轮换完一轮
			if(index==6){
				index=1;
				
			}
		}
		//一次性定时器:指定时间去调用函数
		setTimeout("wfgd()", 1000);
		var i =0;
		//无缝滚动函数
		function wfgd() {
				//获取wfgd的dom元素
				var d = document.getElementById("wfgd");
				//设置滚动条高度
				d.scrollTop=i;
				//i自增，改变滚动条要设置的高度
				i+=2;
				//判断滚动条高度是否是一个DIV高度
				if (    d.scrollTop == 140
					 || d.scrollTop == 280
					 || d.scrollTop == 420
					 
					){
					setTimeout("wfgd()", 1000);
				}else if (d.scrollTop == 560) {
					//如果滚动条高度为最大，那么将重置
					i=0;
					setTimeout("wfgd()", 1000);
				}else{
					setTimeout("wfgd()", 10);
				}
				
			}
		/* function closegg() {
			//获取gg的dom对象
			document.getElementById("gg").style.display="none";
		} */
		
	
	</script>
		
	</head>
		<body>
		<div id="backTop"></div>
		<div id="tm" hidden></div>
				<div id="Login" hidden>
					<form action="Login" method="post">
						<table>
						<c:if test="${msg==false}">
							<tr>
									<td colspan="2"><font style="color: red;">用户名或密码错误</font></td>
							</tr>
						</c:if>
							<tr>
								<td>用户名:</td>
								<td><input type="text" name="uname"></td>
							</tr>
							<tr>
								<td>密码:</td>
								<td><input type="password" name="upwd"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<input type="submit" value="登录" class="sub">
								</td>
							</tr>
						</table>
					</form>
				</div>
			<div id="top">
			<ul>
				<li id="chosecity">
						送至:<font id="city">江西</font>
					<ul id="allcity">
						<li>北京</li>
						<li>上海</li>
						<li>广州</li>
						<li>深圳</li>
						<li>天津</li>
						<li>湖北</li>
						<li>湖南</li>
						<li>福建</li>
						<li>云南</li>
						<li>四川</li>
					</ul>
				 </li>
				<li style="width: 80px;"></li>
				<c:if test="${empty user}">
					<li><a href="javaScript:;" id="lg">您好，请登录</a></li>
					<li>丨</li>
					<li><a href="regist.jsp"style="color:red;">免费注册</a></li>
					<li>丨</li>
				</c:if>
				<c:if test="${!empty user}">
					<li>欢迎您！${user.uname}</li>
					<li>丨</li>
					<li><a href="Exit">退出</a></li>
					<li>丨</li>
				</c:if>
				<li><a href="//order.jd.com/center/list.action">我的订单</a></li>
				<li>丨</li>
				<li><a href="//home.jd.com/">我的京东</a></li>
				<li>丨</li>
				<li><a href="//vip.jd.com/">京东会员</a></li>
				<li>丨</li>
				<li><a href="//b.jd.com">企业采购</a></li>
				<li>丨</li>
				<li><a href="//app.jd.com">手机京东</a></li>
				<li>丨</li>
				<li id="gzjd" style=""><a href="javaScript:;">关注京东</a>
						<div id="gzjd_ewm" ><!-- hidden -->
							<img alt="二维码" title="二维码" src="images1/57bfe32fNbf75b97c.jpg">
						</div>
				</li>
				<li>丨</li>
				<li><a href="javaScript:;">客户服务</a></li>
				<li>丨</li>
				<li><a href="javaScript:;">网站导航</a></li>
			</ul>
			</div>
			<div id="gg">
				<div><input type="button" id="closegg" onclick="closegg()"></div>
			</div>
			<div id="logo">
				<div id="logo_search">
				<input type="text">
				<input type="button" value="搜索">
				</div>
				<div id="logo_car">
					<a>我的购物车</a>&nbsp;&nbsp;&nbsp;>
					<div>0</div>
				</div>
				<div id="logo_con">
					<font style="color: #B1191a;">低至9.9</font>
					5件5折
					3件7折
					领千万优惠
					速食调味
					金九月饼
					乳清蛋白
					天天果园
					四件套
				</div>
			</div>
			<div id="menu">
				<ul>
					<li>全部商品分类</li>
					<li><a href="javaScript:;">服装城</a></li>
					<li><a href="javaScript:;">美妆馆</a></li>
					<li><a href="javaScript:;">京东超市</a></li>
					<li><a href="javaScript:;">生鲜</a></li>
					<li><a href="javaScript:;">全球购</a></li>
					<li><a href="javaScript:;">闪购</a></li>
					<li><a href="javaScript:;">团购</a></li>
					<li><a href="javaScript:;">拍卖</a></li>
					<li><a href="javaScript:;">金融</a></li>
				</ul>
			</div>
			<div id="content">
				<div class="content_left">
					<ul>
						<li>家用电器</li>
						<li>手机、运营商、数码</li>
						<li>电脑、办公</li>
						<li>家居、家具、家装、厨具</li>
						<li>男装、女装、童装、内衣</li>
						<li>个护化妆、清洁用品、宠物</li>
						<li>鞋靴、箱包、珠宝、奢侈品</li>
						<li>运动、户外、钟表</li>
						<li>汽车、汽车用品</li>
						<li>母婴、玩具乐器</li>
						<li>食品、酒类、生鲜、特产</li>
						<li>医药保健</li>
						<li>图书、音像、电子书</li>
						<li>彩票、旅行、充值、票务</li>
						<li>理财、众筹、白条、保险</li>
					</ul>
				</div>
				<div class="content_middle">
						<img id="img1" style="width: 100%; height: 460px;" src="images1/57eb8238Nc544e559.jpg">
						<img id="img2" style="width: 100%; height: 460px;" src="images1/57ec7babN4f2640d5.jpg" hidden/>
						<img id="img3" style="width: 100%; height: 460px;" src="images1/57ec6423Nfb095a69.jpg" hidden/>
						<img id="img4" style="width: 100%; height: 460px;" src="images1/57eca494Nf8daf47a.jpg" hidden/>
						<img id="img5" style="width: 100%; height: 460px;" src="images1/57ece912Ne29628bf.jpg" hidden/>
						<img id="img6" style="width: 100%; height: 460px;" src="images1/57edc982N6bd11c54.jpg" hidden/>
				</div>
				<div class="content_right">
						<ul class="content_right_con">
							<li>京东快报 <p>更多 ></p></li>
							<li><a href="javaScript:;"><strong>[特惠]</strong>&nbsp;10元带你游世界！</a></li>
							<li><a href="javaScript:;"><strong>[公告]</strong>&nbsp;京东配送旧衣回收公益活动</a></li>
							<li><a href="javaScript:;"><strong>[特惠]</strong>&nbsp;零食风暴 满169减70</a></li>
							<li><a href="javaScript:;"><strong>[公告]</strong>&nbsp;河南驻马店仓开仓公告</a></li>
							<li><a href="javaScript:;"><strong>[特惠]</strong>&nbsp;iPhone 7 放量抢，先到先得</a></li>
						</ul>
						<ul class="content_right_12img">
							<li><div></div>话费</li>
							<li><div></div>机票</li>
							<li><div></div>电影票</li>
							<li><div></div>游戏</li>
							<li><div></div>彩票</li>
							<li><div></div>加油站</li>
							<li><div></div>酒店</li>
							<li><div></div>火车票</li>
							<li><div></div>众筹</li>
							<li><div></div>理财</li>
							<li><div></div>礼品卡</li>
							<li><div></div>白条</li>
							
						</ul>
						<img src="images1/57f85146N917e784e.jpg" style="width:210px;height:98px;">
				</div>
				
			</div>
			<div id="ttrm">
				<div id="ttdj">
					<p>天天低价</p>
					<table border="1";cellpadding="0"; cellspacing="0"; bordercolor="#ededed";>
						<tr>
						<td rowspan="2" class="shop">
							<img src="images2/56721c4cN77b06c14.jpg" class="shop_bigimg">
							<p><strong>【京东配送】</strong>凯美源 （KAIMEIYUAN</p>
							<p class="price">179.00</p>
						</td>
						<td class="shop2">
							<img src="images2/57fb90b0Nc9822202.jpg" class="shop_bigimg2">
							<p>靓琦斯源&nbsp;2016秋冬新款中长款针</p>
							<p class="price" >79.00</p>
						</td>
						<td class="shop2">
							<img src="images2/5770f100Ne8d84820.jpg" class="shop_bigimg2">
							<p>【简约套装版】魅族 魅蓝3s</p>
							<p class="price">579.00</p>
						</td>
						</tr>
						<tr>
						
						<td class="shop2">
							<img src="images2/54a24d82N57b340ce.jpg" class="shop_bigimg2">
							<p>heisou 650ml 耐热玻璃透明过滤</p>
							<p class="price">79.00</p>
						</td>
						<td class="shop2">
							<img src="images2/57fb9021Naa055852.jpg" class="shop_bigimg2">
							<p>虹轩葶2016秋冬欧美新款时尚潮</p>
							<p class="price">110.00</p>
						</td>
						</tr>
					</table>
				</div>
				<div id="rmtj">
					<p style="width: 360px;">热门推荐</p>
					<div id="wfgd">
							<div class="wfgd_img">
									<img src="images2/62uyt232.png"/>
							</div>
							<div class="wfgd_img">
									<img src="images2/92duf2156.png"/>
							</div>
							<div class="wfgd_img">
									<img src="images2/9237rtomc2.png"/>
							</div>
							<div class="wfgd_img">
									<img src="images2/af13962tav.png"/>
							</div>	
							<div class="wfgd_img">
									<img src="images2/62uyt232.png"/>
							</div>
							<div class="wfgd_img">
									<img src="images2/92duf2156.png"/>
							</div>
					</div>
				</div>
				
			</div>
		</body>
  
</html>