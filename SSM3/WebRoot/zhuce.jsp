<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
  <head>
    <title>次元星空</title>
        <style type="text/css">
    	body {background-image: url("img/70858371_p0.jpg");
    			background-repeat: no-repeat;
    			-webkit-background-size: 100% 100%;
   			 -moz-background-size: 100% 100%;
    		-o-background-size: cover;
   			background-size: cover;
			background-attachment:fixed;
}	
    </style> 
	<link rel="stylesheet" type="text/css" href="css/xiushi.css"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
  </head>
  
  <body>
	
	<script type="text/javascript">
		/* 查找是否有同名 */
		function checkUsername(name){
			$.get("/SSM/test/all.do",{name : name},function(data){
				if(data.tf && name!=""){
				document.getElementById("massage").style.color="magenta";
				document.getElementById("zhuce").onsubmit= function() {
					return true
				};	
				$("#massage").text("用户名可用");
				
				}else{	
				  document.getElementById("massage").style.color="#ff0000";		
				  $("#massage").text("用户名不可用");
				  document.getElementById("zhuce").onsubmit=function() {
					return false
				};	
				}
			},"json");
			
		}
		function ifsum(){
				var name = document.getElementById('names').value;
                var password = document.getElementById('password').value;
				if(name!="" && password !=""){
					alert("注册成功");
					}else{
						alert("用户名或密码不能为空");
						document.getElementById("zhuce").onsubmit=function() {
						return false
						};	
					}	
		}
			
		</script>

		<!-- 表单提交注册信息 -->
<form class="form-horizontal" id="zhuce" action="${pageContext.request.contextPath}/test/register.do" method="get" style="height: 300px" >
		  <div class="form-group" > 
		  <h1 class="sd">Login</h1>
		    <div class="textbox">
		  		<i class="fa fa-user" aria-hidden="true"></i>
		     	<input type="text" name="name" placeholder="用户名" id = "names" onblur="checkUsername(this.value);"/>
		    </div>
		    <label for="inputEmail3" class="col-sm-2 control-label"><span id="massage"></span></label>
		  
		  
		  
		    <div class="textbox">
		   	 <i class="fa fa-lock" aria-hidden="true"></i>
		      	<input type="text" class="form-control" name="age" placeholder="密码由字母和数字组成"  id ="password">
		    </div>
		    <label for="inputPassword3" class="col-sm-2 control-label"><span id="massage"></span></label>
  			<!-- 按钮注册 -->
	      		<input type="submit" class="longin" value="注册" onclick="ifsum()" />
		  	</div>	  
</form>
</body>
</html>
