<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
 <link rel="stylesheet" href="layui/css/layui.css">
	<script src="layui/layui.all.js"></script>
	<script src="layui/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div style="padding: 15px;">内容主体区域
		<form class="layui-form" action="">
			<div class="layui-form-item">
    			<label class="layui-form-label">账号：</label>
    			<div class="layui-input-block">
      				<input type="text" name="userName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
    			</div>
    		</div>
  			<div class="layui-form-item">
    			<label class="layui-form-label">密码：</label>
    			<div class="layui-input-inline">
      				<input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    			</div>
    		<div class="layui-form-item">
    			<label class="layui-form-label">性别：</label>
    			<div class="layui-input-block">
      				<input type="radio" name="sex" value="男" title="man">
      				<input type="radio" name="sex" value="女" title="woman" checked>
    			</div>
  			</div>
  			<div class="layui-form-item">
    			<label class="layui-form-label">复选框</label>
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