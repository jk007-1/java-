 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
    <title>次元星空</title>
     <%-- <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">  --%>
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

			color: #fff;
  		}
  	</style>
  	<link rel="stylesheet" type="text/css" href="css/xiushi.css"/>
  
	 <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
      
  </head>
  <body>
  

	<!-- ***********************************页码******************************************************* -->

<!-- *****************************************左边导航************************************************************* -->

  <!-- *****************************************上边导航************************************************************* -->

<!-- ************************************************图片************************************************************** -->


<!-- ************************************************文本************************************************************** -->
  	<div style="position:relative;z-index:9999;">
	<jsp:include page="daohang.jsp"/>
	</div>   
	  


      	<div>
	<jsp:include page="homepage.jsp"/>
	</div>    

  </body>
</html>
