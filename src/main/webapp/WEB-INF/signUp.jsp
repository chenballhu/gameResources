<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>

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
			
			$.ajax({
				  type: 'POST',
				  url: "signUp?name="+UserName+"&password="+password+,
				  success: function(data){
					  if(data.state==1){
						  layer.msg('用户名或密码错误');
						  return;
					  }
		}
  	</script>

	<div style="padding: 15px;">
		<form class="layui-form" action="">
			<div class="layui-form-item">
    			<label class="layui-form-label">账号：</label>
    			<div class="layui-input-inline">
      				<input type="text" id="userName" name="userName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
    			</div>
    		</div>
    		
  			<div class="layui-form-item">
    			<label class="layui-form-label">密码：</label>
    			<div class="layui-input-inline">
      				<input type="password" id="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    			</div>
    			<div class="layui-form-mid layui-word-aux">辅助文字</div>
    		</div>
    			
    		<div class="layui-form-item">
    			<label class="layui-form-label">性别：</label>
    			<div class="layui-input-inline" >
      				<input type="radio" name="sex" value="男" title="男" >
      				<input type="radio" name="sex" value="女" title="女" checked>
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<label class="layui-form-label">是否年满18岁：</label>
    			<div class="layui-input-radio">
      				<input type="radio" name="adult" value="0" title="是">
      				<input type="radio" name="adult" value="1" title="否" checked>
    			</div>
  			</div>
  			
  			<div class="layui-form-item">
    			<label class="layui-form-label">喜欢的游戏类型：</label>
    			<div class="layui-input-block">
      				<input type="checkbox" name="like[write]" title="写作">
      				<input type="checkbox" name="like[read]" title="阅读" checked>
      				<input type="checkbox" name="like[dai]" title="发呆">
    			</div>
  			</div>
		</form>
	</div>
 	
 	
	
</body>
</html>