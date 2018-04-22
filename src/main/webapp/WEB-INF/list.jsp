<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
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

        .list-item{
          position: relative;
          margin-top: 20px;
          height: 200px;
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
    <!-- -----固定浮动底部栏-----   战舰烧酒阿鲁! -->
  </div>
</div>




<script>
//JavaScript代码区域
var data_count = 0;
var DATA_LIMIT = 5;
// test data
var data_list = "${search}";

$(function(){
  // total data number, get from db
  data_count = 123;
  render_lists(data_list);
  layui.use('element', function(){
    var element = layui.element;
    var laypage = layui.laypage;
  
    laypage.render({
      elem: 'pages',
      count: data_count,
      limit: DATA_LIMIT,
      jump: function(obj, first){
        if (!first){
          //render_lists(get_data_from_server(obj.curr));
            render_lists(data_list);
          }
        }
    });

  });
});

function render_lists(data_list){
  $(".list-item").remove();
  for (var i = data_list.length - 1; i >= 0; i--){
    var data = data_list[i];
    $("#game-list").prepend('<div class="list-item"><div class="list-item-name">' +data['cn'] + '\t' + data['en'] +
      '</div><div class="list-item-content">' + data['station'] + '\t' + data['player'] + '</div></div>');
  }
  $("#game-list").append('<div id="pages"></div>');
}

function get_data_from_server(curr_page){
  // TODO get data from db
}
    

</script>
</body>
</html>