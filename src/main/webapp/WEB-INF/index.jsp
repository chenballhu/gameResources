<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="layui-logo">yanhan</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    
    
    	<li class="layui-nav-item">
        <a href="index.jsp">
        <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe68e;</i>  
        	首页
        </a>       
      </li>
      
      
      <li class="layui-nav-item"><a href="../list.jsp">
      <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe705;</i>
      	档案</a></li>
      <li class="layui-nav-item"><a href="">
      	<i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe641;</i>
    	技术文档</a></li>
      
    </ul>
   
  </div>
  
 
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
   	 
    
    <!-- 搜索栏 -->
     <div id="top_input" class="lf">
        <input id="input" type="text" placeholder="请输入您要搜索的内容" style="width:360px; height: 30px;"/>
        <a href="http://www.layui.com" class="layui-btn layui-btn-radius layui-icon">&#xe615;&nbsp;&nbsp;搜索</a>
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
					<input id="inputPassword" type="text" placeholder="请输入密码" name="password" style="width:180px; height: 30px;"/>
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
		<div><a href="" style="color:red">1.xxx</a></div>
		<div><a href="">1.xxx</a></div>
		<div><a href="">1.xxx</a></div>
		<div><a href="">1.xxx</a></div>
		<div><a href="">1.xxx</a></div>
		<div><a href="">1.xxx</a></div>
		<div><a href="">1.xxx</a></div>
		<div><a href="">1.xxx</a></div>		
	</div>
 
 
 
 
  
  <!-- 轮播图1 -->
 <div class="layui-carousel" id="test1">
  <div carousel-item>
    <div>条目1</div>
    <div>条目2</div>
    <div>条目3</div>
    <div>条目4</div>
    <div>条目5</div>
  </div>
</div>

<!-- 轮播图2 -->
<div style="margin-top: 20px;">
 <div class="layui-carousel" id="test2">
  <div carousel-item>
    <image src="pictures/123.jpg"></image>
    <div>条目2</div>
    <div>条目3</div>
    <div>条目4</div>
    <div>条目5</div>
  </div>
</div>
</div> 

<!-- 轮播图3 -->
<div style="margin-top: 20px;">
 <div class="layui-carousel" id="test3">
  <div carousel-item>
    <div>条目1</div>
    <div>条目2</div>
    <div>条目3</div>
    <div>条目4</div>
    <div>条目5</div>
  </div>
 </div>
</div>    
    
</div>
  


	


	</div>
</div>



<script>
//JavaScript代码区域

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
		  url: "login?name="+name+"&password="+password,
		  success: function(data){
			  if(data.state==1){
				  layer.msg('用户名或密码错误');
				  return;
			  }
			  $("#Logininfo").css("display","none");
			  $("#info").css("display","block");
			  
			  $("#showName").text("欢迎登陆"+name);
		  },
		  dataType: "json"
		});
	return;
}

function signUp1(){
	layer.open({
		type: 2,
		title: '注册',
		shadeClose: true,
		shade: false,
		maxmin: true, //开启最大化最小化按钮
		area: ['893px', '600px'],
		content: 'toSignUp'
	});
	return;
}








layui.use('element', function(){
  var element = layui.element;
  
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