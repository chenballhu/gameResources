<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
		#d1{
			width:400px;height:450px;
			background-color: #2F4056;
			position: absolute;z-index: 3;
			top:70px;right:70px;
			font-size: 30px;
			color: white;			
		}	
        .list-item-name{
          width: 200px;
          height: 200px;
          background-color: #2F4056;
          position: relative;
          float: left;
        }
        .list-item-content{
          width: 600px;
          height: 200px;
          background-color: #2F4056;
          position: relative;
          float: left;
          left: 40px;
        }
		img{  
        width: auto;  
        height: auto;  
        max-width: 100%;  
        max-height: 100%;     
   		}  
        .list-item{
          position: relative;
          margin-top: 20px;
          height: 200px;
        }
        #index a{
        font-size: 50px;
        }
        /*#l1l{
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
        */
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
</style>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>搜索</title>
  <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.all.js"></script>
    <script src="layui/jquery-3.3.1.min.js"></script>
</head>
<body class="layui-layout-body" style="background-color: #eeeeee">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">搜索</div>
    
    <!-- 右边索引 -->
    <div id="d1" class="layui-anim layui-anim-scale">
		<div id="index" >
			<div>按首字母索引</div>
			<a>A</a>&nbsp;&nbsp;<a>B</a>&nbsp;&nbsp;<a>C</a>&nbsp;&nbsp;<a>D</a>&nbsp;&nbsp;<a>E</a>&nbsp;&nbsp;<a>F</a>&nbsp;&nbsp;<a>G</a>&nbsp;&nbsp;
			<a>H</a>&nbsp;&nbsp;<a>I</a>&nbsp;&nbsp;<a>J</a>&nbsp;&nbsp;<a>K</a>&nbsp;&nbsp;<a>L</a>&nbsp;&nbsp;<a>N</a>&nbsp;&nbsp;<a>M</a>&nbsp;&nbsp;
			<a>O</a>&nbsp;&nbsp;<a>P</a>&nbsp;&nbsp;<a>Q</a>&nbsp;&nbsp;<a>R</a>&nbsp;&nbsp;<a>S</a>&nbsp;&nbsp;<a>T</a>&nbsp;&nbsp;<a>U</a>&nbsp;&nbsp;
			<a>V</a>&nbsp;&nbsp;<a>W</a>&nbsp;&nbsp;<a>X</a>&nbsp;&nbsp;<a>Y</a>&nbsp;&nbsp;<a>Z</a>
		</div>
		
	</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    
    
        <li class="layui-nav-item">
        <a href="index">
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
        <div id="seleteBox">
        	<a class="layui-btn layui-btn-radius layui-icon" onclick="toSearch('0')">&#xe615;&nbsp;&nbsp;全站搜索</a>
        	<div id="dropdown-content">
        		<a class="layui-btn layui-btn-radius layui-icon" onclick="toSearch('1')">&#xe615;&nbsp;&nbsp;仅NGC</a>
        		<a class="layui-btn layui-btn-radius layui-icon" onclick="toSearch('2')">&#xe615;&nbsp;&nbsp;仅PC</a>
        		<a class="layui-btn layui-btn-radius layui-icon" onclick="toSearch('3')">&#xe615;&nbsp;&nbsp;仅Wii</a>
        	</div>
        </div>
    </div>
 
 <!-- 分割用的div -->
 <div style="height: 30px;" id="game-list"></div>
 
  <!--
  <div class="list-item">
    <div id="l1l" class="list-item-name"></div>
    <div id="l1r" class="list-item-content"></div>
  </div>
   
  <div class="list-item">
    <div id="l2l" class="list-item-name"></div>
    <div id="l2r" class="list-item-content"></div>
  </div>

  <div class="list-item">
    <div id="l3l" class="list-item-name"></div>
    <div id="l3r" class="list-item-content"></div>
  </div>

  <div class="list-item">
    <div id="l4l" class="list-item-name"></div>
    <div id="l4r" class=" list-item-content"></div>
  </div>
-->
  
  
    
  </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    <div id="page"></div>
  </div>
</div>




<script>
//JavaScript代码区域


window.onload=function(){
	$("#index a").click(function(){
		 var str1 = $(this).text();
		 index(str1);
	});

	
	var str = "${str}";
	var type = "${type}";
	$.ajax({
		  type: 'GET',
		  url: "search",
		  contentType:"application/UTF-8",
		  data:{'str':str,'type':type},
		  success: function(data){
			  if(data.state==1){
				  layer.msg(data.message);
				  return;
			  }else{
				  var list = data.data;
				  if(list.length==0){
					  layer.msg("没有相匹配内容");
					  return;
				  }
				  //分页
				  layui.use('laypage', function(){
					  var laypage = layui.laypage;
					  
					  //执行一个laypage实例
					  laypage.render({
					    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
					    ,count: 50 //数据总数，从服务端得到
					    ,count:list.length
					    ,limit:5
					    ,jump: function(obj, first){
					    	 //首次不执行
					        if(!first){
					        	$(".list-item").remove();
					        }
					        //obj包含了当前分页的所有参数，比如：
					        var curr = obj.curr; //得到当前页，以便向服务端请求对应页的数据。
					        var limit = obj.limit; //得到每页显示的条数
					        for(var i=(curr-1)*limit;i<((curr-1)*limit+limit);i++){
					        	
					        	$("#game-list").prepend('<div class="list-item"><div class="list-item-name"><img src="pictures/icon/' +list[0].station + '.jpg">'
					        			+ '</div><div class="list-item-content" onclick="toGame('+list[i].id+')">中文名：' + list[i].cn + '<br>' + '英文名：' + list[i].en + '<br>' 
					        			+ '游戏类型：' + list[i].kind + '<br>' + '出版商：' + list[i].company + '<br>' + '游戏人数：' + list[i].player + '</div></div>');
					        	if(i==list.length-1){
					        		return;
					        	}
					        }
					        
					       
					      }
					  });
					});
			  }
			  
		  },
		  dataType: "json"
		});
}
//跳转到游戏内页
function toGame(id){
	 window.location.href="game?id="+id;
 }
 
 function toSearch(type){
	 var str = document.getElementById("input").value;
	 window.location.href="list?str="+str+"&type="+type;
 }
 //首字母索引
 function index(str1){
	 $.ajax({
		  type: 'GET',
		  url: "search2",
		  contentType:"application/UTF-8",
		  data:{'str1':str1},
		  success: function(data){
			  if(data.state==1){
				  layer.msg(data.message);
				  return;
			  }else{
				  var list = data.data;
				  if(list.length==0){
					  layer.msg("没有相匹配内容");
					  return;
				  }
				  //分页
				  layui.use('laypage', function(){
					  var laypage = layui.laypage;
					  
					  //执行一个laypage实例
					  laypage.render({
					    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
					    ,count: 50 //数据总数，从服务端得到
					    ,count:list.length
					    ,limit:5
					    ,jump: function(obj, first){
					    	 //首次不执行
					        if(!first){
					        	$(".list-item").remove();
					        }
					        $(".list-item").remove();
					        
					        var curr = obj.curr; 
					        var limit = obj.limit; 
					        for(var i=(curr-1)*limit;i<((curr-1)*limit+limit);i++){
					        	
					        	$("#game-list").prepend('<div class="list-item"><div class="list-item-name"><img src="pictures/icon/' +list[0].station + '.jpg">'
					        			+ '</div><div class="list-item-content" onclick="toGame('+list[i].id+')">中文名：' + list[i].cn + '<br>' + '英文名：' + list[i].en + '<br>' 
					        			+ '游戏类型：' + list[i].kind + '<br>' + '出版商：' + list[i].company + '<br>' + '游戏人数：' + list[i].player + '</div></div>');
					        	if(i==list.length-1){
					        		return;
					        	}
					        }
					        
					       
					      }
					  });
					});
			  }
			  
		  },
		  dataType: "json"
		});
 }
</script>
</body>
</html>