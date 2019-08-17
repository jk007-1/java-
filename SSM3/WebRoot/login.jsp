<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE >
<html lang="en" dir="ltr">
  <head>
    <title>次元星空</title>
    <!-- 设置背景 -->
        <style type="text/css">
    	body {background: url("img/70858371_p0.jpg") no-repeat;
    			-webkit-background-size: 100% 100%;
   			 -moz-background-size: 100% 100%;
   			background-size: cover;
			position: fixed;
			  margin: 0;
  padding: 0;
  font-family: sans-serif;
}	
    </style> 
   <%--  <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">  --%>
	<link rel="stylesheet" type="text/css" href="css/xiushi.css"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
  </head>
  
  <body  style="width:100%;text-align:center;top: 50%"  >
 
    
    <!-- 登录 -->
   <script type="text/javascript">
   		function tf(){
   			var name = document.getElementById('name').value;
   			var age = document.getElementById('age').value;
   			if(name!=""&&age!=""){
   			$.get("/SSM/test/mapper.do",{name:name,age:age},function(datas) {
   			var t = "datas.boll";
   				if(datas.boll){
   				 ID(name);
   				var exp = new Date();
                            exp.setTime(exp.getTime() + 60 * 1000 * 60 * 24); //24小时
                            document.cookie = "userName=" + name + ";expires=" + exp.toGMTString();
                            document.cookie = "passWord=" + age + ";expires=" + exp.toGMTString();
   				window.location = "/SSM/index.jsp";
   				}else{
   					$("#massage").text("用户名或密码错误");
   				}
   			},"json");
   			}else{
   				$("#massage").text("用户名或密码错误");
   			}
   		}
   		 function ID(name){
   				$.get("/SSM/test/massage.do",{name:name},function() {
   					},"json");
   				} 

   		
   </script>
   
		  <div class="form-group" > 
		  <h1>Login</h1>
		  
		    	<div class="textbox">
        			<i class="fa fa-user" aria-hidden="true"></i>
		     	 		<input type="text" name="name" id="name" placeholder="UserName" />
		    	</div>
		
		   		 <div class="textbox">
        			<i class="fa fa-lock" aria-hidden="true"></i>
		      			<input type="password" class="form-control" name="age" id="age" placeholder="PassWord" >
		    	</div>
		    			<label for="inputPassword3" class="col-sm-2 control-label"><span id="massage"></span></label>
  				<!-- 按钮登录 -->
	      				<input type="submit" class="longin" value="登录" onclick="tf()"/>
		
      
			    <!-- 按钮注册 -->
			    <script type="text/javascript">
			    	function zhuce(){
			    		window.open("zhuce.jsp",'_blank')
			    	}
			    </script>
				      		<input type="button" class="longin"  value="注册" onclick="zhuce()"/>
					  </div>
  </body>
</html>
