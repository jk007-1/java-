<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://129.28.25.131/SSM/">  
  <%--  <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"> --%>
    <title>左边导航</title>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

</head>

<body>
<div style="position: relative; width: 100%;">
<div class="shuoming" style="position: fixed;top:100%; 
width: 2000px; height: 50px;; background-color: black;">
	<h3 style="position: absolute;left: 800px; top: 20px;">次元星空@作者：烧酒HXH--934221719</h3>
</div>

</div>
<div class="sidebar">
  <h1><i class="fa fa-bars push"></i>Animated <span class="color">Menu</span></h1>
    <ul>
    <li><a href="index.jsp"><i class="fa fa-dashboard push"></i>首页信息<i class="fa fa-angle-right"></i></a><span class="hover"></span>
    </li>
    <li><a href="#"><i class="fa fa-user push"></i>用户管理<i class="fa fa-angle-right"></i></a><span class="hover"></span>
      <ul class="sub-menu">
         <li><a href="#">敬请期待4<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
         <li><a href="#">个人信息<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
      </ul>
    </li>
    <li><a href="#"><i class="fa fa-cog push"></i>个性设置<i class="fa fa-angle-right"></i></a><span class="hover"></span>
     <ul class="sub-menu">
         <li><a href="#">敬请期待1<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
         <li><a href="#">敬请期待2<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
        <li><a href="#">敬请期待3<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
       <li><a href="#">个人信息<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
      </ul></li>
    <li><a href="#"><i class="fa fa-picture-o push"></i>图文分享<i class="fa fa-angle-right"></i></a><span class="hover"></span>
        <ul class="sub-menu">
         <li><a id="ifaddpage">发布博客<i class="fa fa-angle-right"></i></a><span class="hover"></span>
          </li>
         <li><a href="#">敬请期待5<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
      </ul>
    </li>
    <li><a href="#"><i class="fa fa-file push"></i>敬请期待<i class="fa fa-angle-right"></i></a><span class="hover"></span>
        <ul class="sub-menu">
         <li><a href="#">敬请期待7<i class="fa fa-angle-right"></i></a><span class="hover"></span>
          </li>
         <li><a href="#">敬请期待8<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
      </ul>
    </li>
    <li><a href="#"><i class="fa fa-plane push"></i>登出<i class="fa fa-angle-right"></i></a><span class="hover"></span></li>
  </ul>
</div>



  <script src='js/jquery.js'></script>

  <script src="js/index.js"></script>
  		
<script>
            function getCookie(name) {
                var strCookie = document.cookie;
                var arrCookie = strCookie.split("; ");
                for (var i = 0; i < arrCookie.length; i++) {
                    var arr = arrCookie[i].split("=");
                    if (arr[0] == name)
                        return arr[1];
                }
                return "";
            }


            var islogin = getCookie("userName");
            if(islogin!==''){
                $("#ifaddpage").attr('href','addpage.jsp');
                $("#ifaddpage").test("发布博客");
            }else{
                 $("#ifaddpage").attr('href','login.jsp');
                	$("#ifaddpage").test("请登录");
            }
        </script>

</body>

</html>