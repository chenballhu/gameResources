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
		
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>test</title>
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
        <a href="javascript:history.back(-1)">
        <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe68e;</i>  
        	首页
        </a>       
      </li>
      
      
      <li class="layui-nav-item"><a href="">
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
<fieldset class="layui-elem-field" style="width: 800px;margin-top: 20px;">
  <legend>A评价</legend>
  <div class="layui-field-box">
    你可以在这里放任何内容
  </div>
</fieldset>
<fieldset class="layui-elem-field" style="width: 800px;">
  <legend>B评价</legend>
  <div class="layui-field-box" >
    你可以在这里放任何内容
  </div>
</fieldset>
<fieldset class="layui-elem-field" style="width: 800px;">
  <legend>C评价</legend>
  <div class="layui-field-box">
    你可以在这里放任何内容
  </div>
</fieldset>
  
    
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    <input type="button" value="点击评论" id="comment"	class="layui-btn layui-btn-radius layui-btn-normal" onclick="comment()">
  </div>
</div>


<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
//评论
function comment(){
	layer.open({
		type: 2,
		title: '评论',
		shadeClose: true,
		shade: false,
		maxmin: true, //开启最大化最小化按钮
		area: ['893px', '600px'],
		content: 'comment'
	});
	return;
}

	



</script>
</body>
</html>