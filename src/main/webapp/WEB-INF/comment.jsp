<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论</title>

 <link rel="stylesheet" href="layui/css/layui.css" media="all">
	<script src="layui/layui.js"></script>
	<script src="layui/jquery-3.3.1.min.js"></script>
</head>
<body>
	<script>
		layui.use('form', function(){
  			var form = layui.form;
		});
		
  	</script>

	<div style="padding: 15px;">
		<form class="layui-form" action="comment" onsubmit="return sub()">
			<!-- 获取游戏id -->
			<input type="text" name="id" value="${id}" style="display:none"/>
			<!-- 获取用户名 -->
			<input type="text" id="user" name="user" value="" style="display:none"/>
  			<div class="layui-form-item">
    			<label class="layui-form-label">CPU:</label>
    			<div class="layui-input-block">
      				<input type="radio" name="cpu" value="i3" title="i3">
      				<input type="radio" name="cpu" value="i5" title="i5" checked>
      				<input type="radio" name="cpu" value="Ryzen 3" title="Ryzen 3">
      				<input type="radio" name="cpu" value="Ryzen 5" title="Ryzen 5">
      				<input type="radio" name="cpu" value="Ryzen 7" title="Ryzen 7">
      				<input type="radio" name="cpu" value="else" title="其他">
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<label class="layui-form-label">内存容量:</label>
    			<div class="layui-input-block">
      				<input type="radio" name="memory" value="2G" title="2G">
      				<input type="radio" name="memory" value="4G" title="4G" checked>
      				<input type="radio" name="memory" value="8G" title="8G">
      				<input type="radio" name="memory" value="16G" title="16G">
      				<input type="radio" name="memory" value="32G" title="32G">
      				<input type="radio" name="memory" value="else" title="其他">
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<label class="layui-form-label">硬盘容量:</label>
    			<div class="layui-input-block">
      				<input type="radio" name="HD" value="500G" title="500G">
      				<input type="radio" name="HD" value="750G" title="750G">
      				<input type="radio" name="HD" value="1T" title="1T" checked>
      				<input type="radio" name="HD" value="2T" title="2T">
      				<input type="radio" name="HD" value="else" title="其他">
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<label class="layui-form-label">显卡:</label>
    			<div class="layui-input-block">
      				<input type="radio" name="gd" value="GTX1080Ti" title="GTX1080Ti或同级别">
      				<input type="radio" name="gd" value="GTX1080" title="GTX1080或同级别" >
      				<input type="radio" name="gd" value="GTX1070Ti" title="GTX1070Ti或同级别">
      				<input type="radio" name="gd" value="GTX1070" title="GTX1070或同级别">
      				<input type="radio" name="gd" value="GTX1060" title="GTX1060或同级别" checked>
      				<input type="radio" name="gd" value="GTX960" title="GTX960或同级别">
      				<input type="radio" name="gd" value="else" title="其他">
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<label class="layui-form-label">操作系统：</label>
    			<div class="layui-input-block" >
      				<input type="radio" name="sys" value="win" title="windows" checked>
      				<input type="radio" name="sys" value="mac" title="mac OS">
      				<input type="radio" name="sys" value="else" title="其他">
    			</div>
  			</div>
  			
  			<div class="layui-form-item layui-form-text">
    			<label class="layui-form-label">评论：</label>
    			<div class="layui-input-block">
      				<textarea name="value" placeholder="请输入内容" required  lay-verify="required" class="layui-textarea"></textarea>
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<div class="layui-input-block">
     				<button class="layui-btn" lay-submit lay-filter="form" >立即提交</button>
     				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
    			</div>
  			</div>
		</form>
	</div>
 	
 	<script type="text/javascript">
 		function sub(){
 			try{
 				var temp = document.cookie.split(";");
 				var name = "";
 				for(var i=0;i<temp.length;i++){
 					if("user"==temp[i].split("=")[0]){
 						name = temp[i].split("=")[1];
 					}
 				}
 				if(name==""){
 					
 					return false;
 				}
 	 			document.getElementById("user").value = name;
 			}catch(err){
 				layer.msg('不能获取登陆状态'); 
 				return false;
 			}
 			
 			
 			var user = "";
 			user = document.getElementById("user").value;
 			
 			if(user==""){
 				layer.msg("不能获取用户名");
 				return false;
 			}
 			layer.msg("评论成功！！");
 			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index); //再执行关闭        
 		}
 		//获取cookies的用户名
 		window.onload=function(){
 			var temp = document.cookie.split(";");
			var name = "";
			for(var i=0;i<temp.length;i++){
				if("user"==temp[i].split("=")[0]){
					name = temp[i].split("=")[1];
				}
			}
			if(name==""){
				layer.msg('不能获取登陆状态'); 
				setTimeout(close(),2000)
				return;
			}
 			document.getElementById("user").value = name;
 			
 			
 		}

 	</script>
	
</body>
</html>