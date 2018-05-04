<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
		#gamelogo{
			width: 800px;
			height: 400px;
			margin-top: 10px;
			background-color: #5FB878;
		}		
		#g1{
			width: 800px;
			height: 400px;
			margin-top: 20px;
			background-color: #5FB878;
		}		
		#g2{
			width: 800px;
			height: 400px;
			margin-top: 20px;
			background-color: #5FB878;
		}
		#g3{
			width: 800px;
			height: 400px;
			margin-top: 20px;
			background-color: #5FB878;
		}
		#tag1{
			margin-left: 50px;
		}
		#tag2{
			margin-left: 10px;
		}
		a{
		cursor:pointer
		}
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>游戏内页</title>
  <link rel="stylesheet" href="layui/css/layui.css">
	<script src="layui/layui.all.js"></script>
	<script src="layui/jquery-3.3.1.min.js"></script>
</head>
<body class="layui-layout-body" style="background-color: #eeeeee">



<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">${map.cn}</div>
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
   	 
    
   
 
 <!-- 分割用的div -->
 <div style="height: 30px;">
 </div>

<!-- 游戏封面 --> 
<div>
	<img id="gamelogo" src="pictures/${map.station}/${map.id}/${map.id}.jpg">
</div>
<!-- 游戏截图 -->
<div id="g1">
	<img alt="" src="pictures/${map.station}/${map.id}/${map.id}.1.jpg" style="width: 800px; height: 400px">
</div>
<!-- 游戏截图 -->
<div id="g2">
	<img alt="" src="pictures/${map.station}/${map.id}/${map.id}.2.jpg" style="width: 800px; height: 400px">
</div>
<!-- 游戏截图 -->
<div id="g3">
	<img alt="" src="pictures/${map.station}/${map.id}/${map.id}.3.jpg" style="width: 800px; height: 400px">
</div>

<!-- 分割用div -->
<div style="margin-top: 20px;"></div>

<!-- 游戏简介 -->
<div style="margin-top: 20px; font-size: 30px;color: white;">
	游戏名字:${map.cn}
</div>
<div style="font-size:20px;color: black;">
	英文名:${map.en}<br>	平台:${map.station }<br>	类别:${map.kind }<br>出版商:${map.company}<br>游戏人数:${map.player}
</div>



<!-- 评价系统 -->
<fieldset class="layui-elem-field" id="comment" style="width: 800px;margin-top: 20px;">
  <legend>评论区</legend>
  <div class="layui-field-box">
    <fieldset class="layui-elem-field" style="width: 800px;">
  
</fieldset>
  </div>
</fieldset>

  
    
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    <input type="button" value="点击评论" id="comment"	class="layui-btn layui-btn-radius layui-btn-normal" onclick="comment()">
    <input type="button" value="勘误" id="debug"	class="layui-btn layui-btn-radius layui-btn-normal" onclick="debug()">
  </div>
</div>


<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
//评论
function comment(){
	
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
	$.ajax({
		  type: 'GET',
		  url: "checkUser",
		  contentType:"application/UTF-8",
		  data:{userName:name},
		  success: function(data){
			  if(data.state==1){
				  layer.msg(data.message);
				  return;
			  }else{
				  var user = data.data;
				  if(!user.permission){
					  layer.open({
							type: 2,
							title: '评论',
							shadeClose: true,
							shade: false,
							maxmin: true, //开启最大化最小化按钮
							area: ['893px', '600px'],
							content: 'toComment?id=${map.id}',
							end:function(){location.reload(true);}
						});
						
				  }else{
					  layer.msg("你已被禁言");
					  return;
				  }
			  }
		  }
	});
	
}
//勘误
function debug(){
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
	$.ajax({
		  type: 'GET',
		  url: "checkUser",
		  contentType:"application/UTF-8",
		  data:{userName:name},
		  success: function(data){
			  if(data.state==1){
				  layer.msg(data.message);
				  return;
			  }else{
				  var user = data.data;
				  if(!user.permission){
					  layer.open({
							type: 2,
							title: '勘误',
							shadeClose: true,
							shade: false,
							maxmin: true, //开启最大化最小化按钮
							area: ['893px', '600px'],
							content: 'toDebug?id=${map.id}',
							end:function(){location.reload(true);}
						});
				  }else{
					  layer.msg("你已被禁言");
					  return;
				  }
			  }
		  }
	});
	
}

window.onload=function(){
	var str = ${map.id};
	$.ajax({
		  type: 'GET',
		  url: "showComment",
		  contentType:"application/UTF-8",
		  data:{id:str},
		  success: function(data){
			  if(data.state==1){
				  layer.msg(data.message);
				  return;
			  }else{
				  var list = data.data;
				  if(list.length==0){
					  return;
				  }
				  for(var i=0;i<list.length;i++){
						$("#comment").append("<div class='layui-field-box'><fieldset class='layui-elem-field' style='width: 800px;'><legend>用户："+list[i].user+
						"<span id='tag1' class='layui-badge layui-bg-orange'>"+list[i].cpu+"</span>"
						+"<span id='tag2' class='layui-badge layui-bg-orange'>"+list[i].memory+"</span>"
						+"<span id='tag2' class='layui-badge layui-bg-orange'>"+list[i].HD+"</span>"
						+"<span id='tag2' class='layui-badge layui-bg-orange'>"+list[i].gd+"</span>"
						+"<span id='tag2' class='layui-badge layui-bg-orange'>"+list[i].sys+"</span>"
						+"</legend><div class='layui-field-box' >"+list[i].value+"</div>");
					}
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