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
		<form class="layui-form" action="signUp">
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
      				<input type="radio" name="sex" value="man" title="男" >
      				<input type="radio" name="sex" value="woman" title="女" checked>
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
      				<input type="checkbox" name="like[RAC]" vlaue="RAC" title="RAC_竞速">
      				<input type="checkbox" name="like[PUZ]" vlaue="PUZ" title="PUZ_益智">
      				<input type="checkbox" name="like[ETC]" vlaue="ETC" title="ETC_其它">
      				<input type="checkbox" name="like[CAG]" vlaue="CAG" title="CAG_卡牌">
      				<input type="checkbox" name="like[RPG]" vlaue="RPG" title="RPG_角色扮演">
      				<input type="checkbox" name="like[AAG]" vlaue="AAG" title="AAG_动作冒险">
      				<input type="checkbox" name="like[STG]" vlaue="STG" title="STG_射击">
      				<input type="checkbox" name="like[ACT]" vlaue="ACT" title="ACT_动作">
      				<input type="checkbox" name="like[TPS]" vlaue="TPS" title="TPS_第三人称射击">
      				<input type="checkbox" name="like[AVG]" vlaue="AVG" title="AVG_冒险">
      				<input type="checkbox" name="like[FTG]" vlaue="FTG" title="FTG_格斗">
      				<input type="checkbox" name="like[ARPG]" vlaue="ARPG" title="ARPG_动作角色扮演">
      				<input type="checkbox" name="like[SIM]" vlaue="SIM" title="SIM_模拟">
      				<input type="checkbox" name="like[FPS]" vlaue="FPS" title="FPS_第一人称射击">
      				<input type="checkbox" name="like[TCG]" vlaue="TCG" title="TCG_养成">
      				<input type="checkbox" name="like[SLG]" vlaue="SLG" title="SLG_策略">
      				<input type="checkbox" name="like[SRPG]" vlaue="SRPG" title="SRPG_战略角色扮演">
      				<input type="checkbox" name="like[SPG]" vlaue="SPG" title="SPG_体育">
      				<input type="checkbox" name="like[TAB]" vlaue="TAB" title="TAB_桌面">
      				<input type="checkbox" name="like[MSC]" vlaue="MSC" title="MSC_音乐">
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