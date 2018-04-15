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
		function isExist(){
			var userName = document.getElementById('userName').value;
			var password = document.getElementById('password').value;
			var sex = document.getElementById('sex').value;
			var adult = document.getElementById('adult').value;
			var like = document.getElementById('like').value;
			
			$.ajax({
				type: 'POST',
				url: "signUp?name="+UserName+"&password="+password+sex+adult+like,
				success: function(data){
					if(data.state==1){
						layer.msg('用户名或密码错误');
						return;
					 }
				},
				dataType: "json"
				});
		}
  	</script>

	<div style="padding: 15px;">
		<form class="layui-form" action="comment">
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
      				<input type="radio" name="gd" value="else" title="其他">
    			</div>
  			</div>
  			
  			<div class="layui-form-item layui-form-text">
    			<label class="layui-form-label">评论：</label>
    			<div class="layui-input-block">
      				<textarea name="text1" placeholder="请输入内容" required  lay-verify="required" class="layui-textarea"></textarea>
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<div class="layui-input-block">
     				<button class="layui-btn" lay-submit lay-filter="form">立即提交</button>
     				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
    			</div>
  			</div>
		</form>
	</div>
 	
 	
	
</body>
</html>