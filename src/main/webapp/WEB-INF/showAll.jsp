<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
		#d1{
			width:1000px;height:700px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:100px;right:480px;
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
    <div class="layui-logo"><a href="index">yanhan</a></div>
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
  </div>
  
 
  
<div class="layui-body">
    <!-- 内容主体区域 -->
	<div style="padding: 15px;">
		
   	 	<div class="d1" id="d1">
   	 	<div style="float: left">
   	 		<table class="layui-table" style="width: 250px">
  				<colgroup>
    				<col width="150">
    				<col width="200">
    				<col>
  				</colgroup>
  				<thead>
    				<tr>
      				<th>游戏ID</th>
      				<th>游戏名字</th>
	      			</tr> 
 				</thead>
  				<tbody id="1">
    
  				</tbody>
			</table>
		</div>
		<div style="float: left">
			<table class="layui-table" style="width:250px">
  				<colgroup>
    				<col width="150">
    				<col width="200">
    				<col>
  				</colgroup>
  				<thead>
    				<tr>
      				<th>游戏ID</th>
      				<th>游戏名字</th>
	      			</tr> 
 				</thead>
  				<tbody  id="2">
    
  				</tbody>
			</table>
		</div>
		<div style="float: left">
			<table class="layui-table" style="width:250px">
  				<colgroup>
    				<col width="150">
    				<col width="200">
    				<col>
  				</colgroup>
  				<thead>
    				<tr>
      				<th>游戏ID</th>
      				<th>游戏名字</th>
	      			</tr> 
 				</thead>
  				<tbody  id="3">
    
  				</tbody>
			</table>
		</div>
		<div style="float: left">
			<table class="layui-table" style="width:250px">
  				<colgroup>
    				<col width="150">
    				<col width="200">
    				<col>
  				</colgroup>
  				<thead>
    				<tr>
      				<th>游戏ID</th>
      				<th>游戏名字</th>
	      			</tr> 
 				</thead>
  				<tbody  id="4">
    
  				</tbody>
			</table>
		</div>
   	 	</div>
    </div>
</div>



<script>
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

layui.use('element', function(){
  var element = layui.element;
  
});          

window.onload=function(){
	$.ajax({
		  type: 'GET',
		  url: "showAll",
		  success: function(data){
			if(data.state==1){
				layer.msg("获取游戏失败");
			}
			var game = data.data;
			for(var i=0;i<game.length;i+=4){
				$("#1").append("<tr><td>"+game[i].id+"</td><td>"+game[i].cn+"</td>");
				$("#2").append("<tr><td>"+game[i+1].id+"</td><td>"+game[i+1].cn+"</td>");
				$("#3").append("<tr><td>"+game[i+2].id+"</td><td>"+game[i+2].cn+"</td>");
				$("#4").append("<tr><td>"+game[i+3].id+"</td><td>"+game[i+3].cn+"</td>");
			}
			
		  },
		  dataType: "json"
		});
}
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
</script>
</body>
</html>