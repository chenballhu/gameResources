<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
		#l1l{
			width:200px;height:200px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:100px;left:20px;		
		}
		
		#l1r{
			width:800px;height:200px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:100px;left:230px;		
		}
		
		#l2l{
			width:200px;height:200px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:320px;left:20px;		
		}	
		
		#l2r{
			width:800px;height:200px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:320px;left:230px;		
		}
		
		#l3l{
			width:200px;height:200px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:540px;left:20px;		
		}
		
		#l3r{
			width:800px;height:200px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:540px;left:230px;		
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
    <div class="layui-logo">Test主页</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    
    
    	<li class="layui-nav-item">
        <a href="toLogin">
        <i class="layui-icon" style="font-size: 30px; color: #009688;">&#xe68e;</i>  
        	首页
        </a>       
      </li>
      
      
      <li class="layui-nav-item"><a href="list">
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
 <div style="height: 30px;">
 </div>
  
	<div id="l1l" class="layui-anim layui-anim-up">
	${list}
	</div>
	<div id="l1r" class="layui-anim layui-anim-scaleSpring">
	</div>
	
	
	<div id="l2l" class="layui-anim layui-anim-up">
	</div>
	<div id="l2r" class="layui-anim layui-anim-scaleSpring">
	</div>
	
	<div id="l3l" class="layui-anim layui-anim-up">
	</div>
	<div id="l3r" class="layui-anim layui-anim-scaleSpring">
	</div>
	



  
    
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © -----固定浮动底部栏-----   战舰烧酒阿鲁!
  </div>
</div>




<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});

var data = ${list};
          
          //调用分页
          laypage.render({
            elem: '111'
            ,count: data.length
            ,jump: function(obj){
              //模拟渲染
              document.getElementById('111').innerHTML = function(){
                var arr = []
                ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                layui.each(thisData, function(index, item){
                  arr.push('<li>'+ item +'</li>');
                });
                return arr.join('');
              }();
            }
          });
          
	



</script>
</body>
</html>