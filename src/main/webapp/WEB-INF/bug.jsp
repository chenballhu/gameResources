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
</style>
	
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>稀缺游戏周边资源整合与管理平台</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
	<script src="../layui/layui.all.js"></script>
	<script src="../layui/jquery-3.3.1.min.js"></script>
	
</head>
<body class="layui-layout-body" style="background-color: #eeeeee">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo"><a href="../index">yanhan</a></div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    
    
    	<li class="layui-nav-item">
        <a href="config">
        <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe69c;</i>  
        	用户管理
        </a>       
      </li>
      
      
      <li class="layui-nav-item"><a href="del">
      <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe640;</i>
      	评论管理</a></li>
      	<li class="layui-nav-item"><a href="del">
      <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe640;</i>
      	勘误</a></li>
      <li class="layui-nav-item"><a href="">
      	<i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe641;</i>
    	技术文档</a></li>
      
    </ul>
   
  </div>
  </div>
  
 
  
<div class="layui-body">
    <!-- 内容主体区域 -->
	<div style="padding: 15px;">
   	 	<div class="d1" id="d1">
   	 		
   	 		<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>游戏名称</th>
      <th>用户名称</th>
      <th>内容</th>
      <th>图片</th>
      <th>删除</th>
    </tr> 
  </thead>
  <tbody>
    
  </tbody>
</table>
   	 	</div>
    	
	</div>
</div>



<script>

layui.use('element', function(){
  var element = layui.element;
  
});          

window.onload=function(){
	$.ajax({
		  type: 'GET',
		  url: "showBug",
		  success: function(data){
			if(data.state==1){
				console.log(data.message);
				return;
			}
			var game = data.data;
			for(var i=0;i<game.length;i++){
					$("tbody").append("<tr><td>"+game[i].cn+"</td><td>"+game[i].userName+"</td><td>"+game[i].value+"</td>"+"<td><img src='../"+game[i].url+"'></td>"+"<td><a onclick=del("+game[i].id+")>删除</a></td></tr>");
			}
			
		  },
		  dataType: "json"
		});
}
//禁言
function del(id){
	layer.confirm('是否删除', {icon: 3, title:'删除',  yes: function(index, layero){
		s1(id);
		layer.msg("成功删除");
		
		},end:function(){
			setTimeout("location.reload(true)", 1000);
			
		}})
	}
function s1(id){
	$.ajax({
		  type: 'GET',
		  data:{'id':id},
		  url: "deleteBug",
		  success: function(data){
			if(data.state==1){
				console.log(data.message);
				return;
			}
			var user = data.data;
			
			
		  },
		  dataType: "json"
		});
}
</script>
</body>
</html>