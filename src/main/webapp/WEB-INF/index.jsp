<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
		#d1{
			width:400px;height:450px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:10px;right:70px;
			font-size: 30px;
			color: white;			
		}	
		
		#d2{
			width:400px;height:480px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:480px;right:70px;
			font-size: 30px;
			color: white;
		}	
		
		#hotOnclick{
			text-align:center;
		}
		
		#welcome{
			text-align:center;
			font-size: 50px;
			color: white;
		}
		
		#exit{								
			font-size: 20px;			
		}
		img{  
			position:absolute;
        	width: auto;  
			height: auto;  
			max-width: 600px;       
		}  
		#seleteBox{
			border: none;
			position:absolute;z-index: 4;
			top:12px;left:380px;
		}
		#dropdown-content {
    		display: none;
    		float:left;
   			position: absolute;
    		
		}
		#dropdown-content a {
    		color: black;
    		
    		text-decoration: none;
    		display: block;
		}
		#seleteBox a:hover {background-color: #f1f1f1}
		#seleteBox:hover #dropdown-content {
    		display: block;
		}
		a{
		cursor:pointer
		}
</style>
	
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>稀缺游戏周边资源整合与管理平台</title>
  <link rel="stylesheet" href="layui/css/layui.css">
	<script src="layui/layui.all.js"></script>
	<script src="layui/jquery-3.3.1.min.js"></script>
	
</head>
<body class="layui-layout-body" style="background-color: #eeeeee">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"><a onclick="toAdmin()">yanhan</a></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    
    
    	<li class="layui-nav-item">
        <a href="index">
        <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe68e;</i>  
        	首页
        </a>       
      </li>
      
      
      <li class="layui-nav-item"><a onclick="toList()">
      <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe705;</i>
      	档案</a></li>
      <li class="layui-nav-item"><a onclick="toShowAll()">
      	<i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe641;</i>
    	目录</a></li>
      
    </ul>
   
  </div>
  
 
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
   	 
    
    <!-- 搜索栏 -->
     <div id="top_input" class="lf">
        <input id="input" type="text" placeholder="请输入您要搜索的内容" style="width:360px; height: 30px;"/>
        <div id="seleteBox">
        	<a class="layui-btn layui-btn-radius layui-icon" onclick="search1('0')">&#xe615;&nbsp;&nbsp;全站搜索</a>
        	<div id="dropdown-content">
        		<a class="layui-btn layui-btn-radius layui-icon" onclick="search1('1')">&#xe615;&nbsp;&nbsp;仅NGC</a>
        		<a class="layui-btn layui-btn-radius layui-icon" onclick="search1('2')">&#xe615;&nbsp;&nbsp;仅PC</a>
        		<a class="layui-btn layui-btn-radius layui-icon" onclick="search1('3')">&#xe615;&nbsp;&nbsp;仅Wii</a>
        	</div>
        </div>
        
        
        
    </div>
 	

 	
 <!-- 分割用的div -->
 <div style="height: 30px;"></div>
  
	<!-- 右边用户信息栏 -->
	<div id="d1" class="layui-anim layui-anim-scale">
		<div id="Logininfo" style="display: block;">
			<div id="welcome">用户登录</div>
			<div style="margin-top: 20px;"></div>
			<div>
				<form action="login" style="margin-left: 30px">
					<input id="inputName" type="text" placeholder="请输入用户名" name="name" style="width:180px; height: 30px;"/><p>
					<div style="margin-top: 20px;"></div>
					<input id="inputPassword" type="password" placeholder="请输入密码" name="password" style="width:180px; height: 30px;"/>
					<div style="margin-top: 40px;"></div>
					<input type="button" value="登录" id="login1"	class="layui-btn layui-btn-radius layui-btn-normal" onclick="login()">
					<input type="button" value="注册" id="signUp"	class="layui-btn layui-btn-radius layui-btn-normal" onclick="signUp1()">
				</form>
			</div>
		</div>
		<div id="info" style="display: none;margin-left: 40px;margin-top: 20px">
			<div id="showName"></div>
			
		</div>
		
	</div>



		
	
	
	<!-- 右边游戏信息栏 -->
	<div id="d2" class="layui-anim layui-anim-scale">
		<div id="hotOnclick">点击排行榜</div>
			<div id="hotOnclick1">
				
			</div>
	</div>
 
 
 
 
  
  <!-- 轮播图1 -->
  NGC
 <div class="layui-carousel" id="test1">

  <div carousel-item style="margin-left: 20%">
  <c:forEach var="i" begin="1" end="9">
  	<img src="pictures/NGC/${i}/${i}.jpg" onclick="list(${i})">
  	</c:forEach>
  </div>
</div>

<!-- 轮播图2 -->
  PC
 <div class="layui-carousel" id="test2">
 	
  <div carousel-item style="margin-left: 20%;">
    <c:forEach var="i" begin="112" end="121">
  	<img src="pictures/PC/${i}/${i}.jpg" onclick="list(${i})">
  	</c:forEach>
  </div>
</div>
 

<!-- 轮播图3 -->
 Wii
 <div class="layui-carousel" id="test3">
 	
  <div carousel-item style="margin-left: 20%">
    <c:forEach var="i" begin="317" end="326">
  	<img src="pictures/Wii/${i}/${i}.jpg" onclick="list(${i})">
  	</c:forEach>
  </div>
 </div>
</div>    
    
</div>
  


	


</div>



<script>
//JavaScript代码区域
//管理员登陆
function toAdmin(){
	layer.prompt({
		  formType: 1,
		  value: '',
		  title: '管理员登陆'
		}, function(value, index, elem){
			$.ajax({
				  type: 'GET',
				  url: "admin/login",
				  data:{password:value},
				  success: function(data){
					  if(data.state==1){
							layer.msg(data.message);
							return;
						}
					var url = data.data;
					location.href=url;
				  },
				  error:function(){
					console.log("未知错误");
				  },
				  dataType: "json"
				});
		  
		});
}
//检查登陆状态
function check(){
	var temp = document.cookie.split(";");
	var name = "";
	for(var i=0;i<temp.length;i++){
		if("user"==temp[i].split("=")[0]){
			name = temp[i].split("=")[1];
		}
	}
	if(name==""){
		layer.msg("请先登陆");
		return false;
	}else{
		return true;
	}
}
//前往检索页
function toList(){
	if(check()){
		location.href="list";
	}else{
		layer.msg("请先登陆");
	}
}
//前往目录
function toShowAll(){
	if(check()){
		location.href="toShowAll";
	}else{
		layer.msg("请先登陆");
	}
}
//获取登陆状态
window.onload=function(){
			var temp = document.cookie.split(";");
			var name = "";
			var like = "";
			for(var i=0;i<temp.length;i++){
				if("user"==temp[i].split("=")[0]){
					name = temp[i].split("=")[1];
				}
				if("like"==temp[i].split("=")[0]){
					like = temp[i].split("=")[1];
				}
			}
			if(!name==""){
				$("#Logininfo").css("display","none");
				$("#info").css("display","block");
				$("#showName").text("欢迎登陆"+name);
				$("#showName").append("<a style='font-size: 20px;margin-left: 20px' onclick='signOut()'>注销</a>");
			}
			//获取排行榜
			$.ajax({
				  type: 'GET',
				  url: "rank",
				  success: function(data){
					var rank = data.data;
					var a = document.getElementById("hotOnclick1");
					for(var i=0;i<rank.length;i++){
						$("#hotOnclick1").append("<div><a href='game?id="+rank[i].id+"'>"+rank[i].cn+"</a></div>");
					}
				  },
				  error:function(){
					console.log("加载排行榜失败");
				  },
				  dataType: "json"
				});
			//获取推荐
			$.ajax({
				  type: 'GET',
				  url: "recommend",
				  contentType:"application/UTF-8",
				  data:{"userName":name},
				  success: function(data2){
					  if(data2.state==1){
						  layer.msg(data2.message);
						  return; 
					  }
					  $("#info").append("<div style='margin-top: 30px'>今日推荐</div>");
					  var cn = data2.data;

					  for(var i=0;i<cn.length;i++){
						  $("#info").append("<div><a href='game?id="+cn[i].id+"'>"+cn[i].cn+"</a></div>");
					  }
					  
				  },
				  dataType: "json"
				});
		}

//登陆
function login(){
	var name = document.getElementById('inputName').value;
	var password = document.getElementById('inputPassword').value;
	if(!name){
		layer.msg('用户名不能为空'); 
		return;
	}
	if(!password){
		layer.msg('密码不能为空'); 
		return;
	}
	$.ajax({
		  type: 'POST',
		  data:{"name":name,"password":password},
		  url: "login",
		  success: function(data){
			  if(data.state==1){
				  layer.msg(data.message);
				  return;
			  }
			  $("#Logininfo").css("display","none");
			  $("#info").css("display","block");
			  $("#showName").text("欢迎登陆"+name);
			  $("#showName").append("<a style='font-size: 20px;margin-left: 20px' onclick='signOut()'>注销</a>");
			  
			  //保存用户登陆状态
				var date=new Date();
				var expireDays=30; //分钟
				date.setTime(date.getTime()+expireDays*1000*60);
			  document.cookie="user="+data.data.name+";expires="+date.toGMTString();
			  document.cookie="like="+data.data.like+";expires="+date.toGMTString();
			  //document.cookie="password="+data.data.password+";expires="+date.toGMTString();
			  location.reload();
			  
			 
			  
		  },
		  dataType: "json"
		});
	
}

//注销登陆
function signOut(){
	var date=new Date();
	date.setTime(date.getTime()-1);
	var temp = document.cookie.split(";");
	var name = "";
	for(var i=0;i<temp.length;i++){
		if("user"==temp[i].split("=")[0]){
			name = temp[i].split("=")[1];
		}
	}
	if(name!=""){
		document.cookie= "user="+name+";expires="+date.toGMTString();
		location.reload("ture");
	}
}

//注册
function signUp1(){
	layer.open({
		id: 1,
		type: 2,
		title: '注册',
		shadeClose: false,
		shade: 0.3,
		maxmin: true, //开启最大化最小化按钮
		area: ['893px', '600px'],
		content: 'toSignUp'
	});
	return;
}

//游戏内页
function list(id){
	
	window.location.href='game?id='+id
}

//搜索功能
function search1(type){
	var temp = document.cookie.split(";");
	var name = "";
	for(var i=0;i<temp.length;i++){
		if("user"==temp[i].split("=")[0]){
			name = temp[i].split("=")[1];
		}
	}
	if(name==""){
		layer.msg("请先登陆");
		return;
	}
	
	
		var a = document.getElementById('input').value;
		if(a==""){
			window.location.href="list";
		}else{
			$.ajax({
				  type: 'GET',
				  url: "search",
				  contentType:"application/UTF-8",
				  data:{'str':a,'type':type},
				  success: function(data){
					  if(data.state==1){
						  layer.msg(data.message);
						  return;
					  }else{
						  location.href="list?str="+a+"&type="+type;
					  }
					  
				  },
				  dataType: "json"
				});
		}
		
	}
//进入管理员界面




layui.use('element', function(){
  var element = layui.element;
  
});

layui.use('form', function(){
	  var form = layui.form;
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    layer.msg(JSON.stringify(data.field));
	    return false;
	  });
	});


layui.use('carousel', function(){
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#test1'
	    ,width: '60%' //设置容器宽度
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
	  });
	});

layui.use('carousel', function(){
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#test2'
	    ,width: '60%' //设置容器宽度
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
	  });
	});
	
	
layui.use('carousel', function(){
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#test3'
	    ,width: '60%' //设置容器宽度
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
	  });
	});


</script>
</body>
</html>