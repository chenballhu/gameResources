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
		layui.use('upload', function(){
			  var upload = layui.upload;
			   var gameId= ${id};
			   var value = $("textarea").val();
			   var user = document.getElementById("user").value;

			  //执行实例
			  var uploadInst = upload.render({
			    elem: '#test1' //绑定元素
			    ,url: 'upload' //上传接口
			    ,data: {id:gameId,
			    		userName:function(){return $('#user').val();},
			    	    value:function(){return $('#value').val();}
			    		}
			    ,accept: 'images'
			    ,auto:false
			    ,bindAction: '#upload'
			    ,acceptMime: 'image/*'
			    ,before: function(obj){
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
			    }
			    ,done: function(res){
			      //上传完毕回调
			      layer.msg("上传完毕");
			      setTimeout("f1()", 2000);
			    }
			    ,error: function(){
			      
			    }
			  });
			});
  	</script>

	<div style="padding: 15px;">
		<form class="layui-form" action="upload" method="post" onsubmit="return sub()">
			<!-- 获取游戏id -->
			<input type="text" name="gameId" value="${id}" style="display:none"/>
			<!-- 获取用户名 -->
			<input type="text" id="user" name="user"  />

  			
  			<div class="layui-form-item layui-form-text">
    			<label class="layui-form-label">勘误内容：</label>
    			<div class="layui-input-block">
      				<textarea name="value" id="value" placeholder="请输入内容" required  lay-verify="required" class="layui-textarea"></textarea>
    			</div>
  			</div>
  			
  			
  			
  			<div class="layui-form-item">
    			<div class="layui-input-block">
     				<button class="layui-btn" type="button" id="upload">立即提交</button>
     				<button type="button" class="layui-btn" id="test1">
  						<i class="layui-icon">&#xe67c;</i>上传图片
					</button>
    			</div>
  			</div>
		</form>
		
	</div>
 	
 	<script type="text/javascript">
 		function sub(){
 			
 			layer.msg("评论成功！！");
 			var t = document.getElementById("uploadButton");
 			t.click();
 			setTimeout('lay.close()',2000);
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
 		//关闭窗口
 		function f1(){
 			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
 			parent.layer.close(index); //再执行关闭   
 		}

 	</script>
	
</body>
</html>