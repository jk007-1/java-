<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html>
<head>
    <title>次元星空</title>
   <%--  <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"> --%>
      <base href="http://129.28.25.131/SSM/"> 
<style type="text/css">
    		body{
  			 background-image: url("img/e687872dgy1fu6ppbv9aqj20xc0knaxk.jpg"); 
  		 	-webkit-background-size: 100% 100%;
   			 -moz-background-size: 100% 100%; 
    		 -o-background-size: cover; 
   			  background-size: cover;  
   			 background-repeat:repeat-y;  
   			background-attachment:fixed;
   				 padding: inherit; 
  		}
  	</style>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <link rel="stylesheet" href="css/text.css">
</head>

<body >
  	<div style="position:relative;z-index:9999;">
	<jsp:include page="daohang.jsp"/>
	</div>  
	
	<h1 id="h1" style="position: absolute; left: 300px;  top: 50px;"></h1>
<div class="showpage">
	<div id="container" >
 		<script type="text/javascript">
                  	$.get("/SSM/test/xiansi.do",{finddata : <%=request.getParameter("param")%>},function(data) {
                  	 document.getElementById("h1").innerHTML=data.title
                  	var s = data.page;
   				document.getElementById('container').innerHTML = s;
   			},"JSON");  
		</script>
	</div> 
</div>

	
</body>
</html>