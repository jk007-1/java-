<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en" >
<head>

<title>jQuery带缩略图焦点图插件DEMO演示</title>
  
  
  

<link rel="stylesheet" href="css/ft-carousel.css" />
<style>
body{margin: 0;font-family: "微软雅黑";background-color: #1F1F1F;}
.example {width: 624px;height: 336px;font-size: 40px;text-align: center;margin: 20px auto;background-color: #464576;}
.carousel-item{line-height: 336px;color: #fff;font-family:  Arial Black}
</style>

</head>
<div class="tupian">
<div class="example">
	<div class="ft-carousel" id="carousel_1">
		<ul class="carousel-inner">
			<li class="carousel-item"><img src="img/a1.jpg" /></li>
			<li class="carousel-item"><img src="img/a2.jpg" /></li>
			<li class="carousel-item"><img src="img/a3.jpg" /></li>
			<li class="carousel-item"><img src="img/a4.jpg" /></li>
			<li class="carousel-item"><img src="img/a5.jpg" /></li>
			<li class="carousel-item"><img src="img/a6.jpg" /></li>
		</ul>
	</div>
</div>
</div>


<script src="js/jquery.js"></script>
<script src="js/ft-carousel.min.js"></script>
<script type="text/javascript">
	$("#carousel_1").FtCarousel();
</script>


</body>
</html>
