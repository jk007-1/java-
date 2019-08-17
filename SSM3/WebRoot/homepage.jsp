<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>分页插件</title>
 	 <!--引入分页样式文件-->
  	<link rel="stylesheet" href="css/text.css">
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
  	<!--先引入jquery-->
    <script src="js/jquery.js"></script>
    
</head>
<body id="pagebody">

	
    <!--再引入toPage.js-->
     <div style="position: absolute;width: 1200px; height: 50px; 
     background-color:rgba(180,180,180,0.8); left:267px; top: 450px; z-index: 20;
     box-shadow: 0 10px 20px -5px rgba(0, 0, 0, 0.15); ">
    	<h1 style="position: relative;top: -20px;left: -40px; color: black;">最新博客:</h1>
    </div> 
    <script src="js/toPage.js"></script>
    <!--分页容器_2-->
    
    <div class="page_2" style="position: relative; top:100%;">
    </div>

    <!--插件使用-->
    <script type="text/javascript">
      /*容器2参数*/
  	num()
     function num(){
     	
    	$.ajax({
    		type: 'get',
    		url: '/SSM/test/num.do',
    		dataType: "json",
    		error: function (arg1) {
    			//请求失败时被调用的函数 
    			console.log(arg1);
    		},
    		success: function (data) {
    		var t =data.num;
      var obj_2={
        obj_box:'.page_2',//翻页容器
        total_item:t,//条目总数
        per_num:7,//每页条目数
        current_page:1//当前页，初始页
      };
       /*调用分页方法,初始化数据*/
      page_ctrl(obj_2);
    
    		}
    	});
     	}

    </script>
</body>
</html>
