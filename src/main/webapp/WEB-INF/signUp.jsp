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
		layui.use('layer', function(){
			  var layer = layui.layer;
			});              
		function isExist(){
			
			var userName = document.getElementById('userName').value;
			var password = document.getElementById('password').value;
			var sex = document.getElementsByName('sex').value;
			var adult = document.getElementsByName('adult').value;
			var like = document.getElementsByName('like').value;
			var ajaxFlag = false; 
			$.ajax({
				  type: 'GET',
				  url: "checkSignUp",
				  contentType:"application/UTF-8",
				  data:{"userName":userName},
				  async:false,//设置同步方式，非异步！  
			      cache:false,//严格禁止缓存！
				  success: function(data){
					  if(data.state==1){
						  layer.msg(data.message);
						  ajaxFlag=false; 
					  }else{
						  ajaxFlag=true; 
					  }
				  },
				  dataType: "json"
				});
			
			if(!ajaxFlag){
				return false;
			}else{
				layer.msg("注册成功",function(){
				layer.closeAll();
				});

				return true;
			}
			
		}
  	</script>

	<div style="padding: 15px;">
		<form class="layui-form" action="signUp" onsubmit="return isExist()">
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
    			<div class="layui-form-mid layui-word-aux">
    				<!-- 密码规则 -->>
    			</div>
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
      				<input type="checkbox" name="like" value="RAC" title="RAC_竞速">
      				<input type="checkbox" name="like" value="PUZ" title="PUZ_益智">
      				<input type="checkbox" name="like" value="ETC" title="ETC_其它">
      				<input type="checkbox" name="like" value="CAG" title="CAG_卡牌">
      				<input type="checkbox" name="like" value="RPG" title="RPG_角色扮演">
      				<input type="checkbox" name="like" value="AAG" title="AAG_动作冒险">
      				<input type="checkbox" name="like" value="STG" title="STG_射击">
      				<input type="checkbox" name="like" value="ACT" title="ACT_动作">
      				<input type="checkbox" name="like" value="TPS" title="TPS_第三人称射击">
      				<input type="checkbox" name="like" value="AVG" title="AVG_冒险">
      				<input type="checkbox" name="like" value="FTG" title="FTG_格斗">
      				<input type="checkbox" name="like" value="ARPG" title="ARPG_动作角色扮演">
      				<input type="checkbox" name="like" value="SIM" title="SIM_模拟">
      				<input type="checkbox" name="like" value="FPS" title="FPS_第一人称射击">
      				<input type="checkbox" name="like" value="TCG" title="TCG_养成">
      				<input type="checkbox" name="like" value="SLG" title="SLG_策略">
      				<input type="checkbox" name="like" value="SRPG" title="SRPG_战略角色扮演">
      				<input type="checkbox" name="like" value="SPG" title="SPG_体育">
      				<input type="checkbox" name="like" value="TAB" title="TAB_桌面">
      				<input type="checkbox" name="like" value="MSC" title="MSC_音乐">
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