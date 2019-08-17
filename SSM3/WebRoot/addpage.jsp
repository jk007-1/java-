<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>次元星空</title>
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
    <link rel="stylesheet" href="css/page.css" media="screen" type="text/css" />
	<!--jquery-->
    <script type="text/javascript" src="js/jquery.js"></script>     
    <!--jquery-form-->
    <script type="text/javascript" src="http://malsup.github.io/jquery.form.js"></script>      
    <style type="text/css">
    img{
    	width: 500px;
    }
    </style> 
    
  </head>
<body class=wenben>

  	<div id="daohang">
	<jsp:include page="daohang.jsp"/>
	</div>  
	
<!-- 网页标题 -->
<div id="addpage">
	<h1 id="addpageh1" style=" position: relative; left: 300px;">创建你的博客内容</h1>
	<div id="editor" class="text" style="width: 800px; position: relative;; left: 20px; top: 300px;">
	
	<!-- 富文本 -->
    </div>
  	<div style="position: relative;;left: 20px;">
            <p  style="position:absolute; top: -215px;">
           			(点击这里上传封面图)<br>
                <img class="user-header"  style=" width: 100px;height: 100px;object-fit: cover;" src="${imgUser.data.userProfilePhoto}">
               		<br>(标题)
            </p>
            
  	<!-- 注意这里提交类型是数组 -->
	<form id="uploadframe" target="uploadframe" action="${pageContext.request.contextPath}/test/loading.do" method="post" onsubmit="return ifnull()" enctype="multipart/form-data">
		<input type="file" id="file" onchange="imgChange(event)" class="inputimg" name="file"style="position: absolute;top: -200px;display: none;">
		<br>
	 	<input type="text" maxlength="30" id="text" onkeydown="checknum()" onkeyup="checknum()" class="text" name="test" style="position: relative;top:-100px; width: 300px;height: 30px; ">
	 	<span id="a" style="position: relative;top:-100px;left: 10px; "></span>
	 	<textarea  id="text1" name="htm" style="width:100%; height:200px; display:none"></textarea>
		<input  type="submit" id="btn1" class="longin" value="提交">
	</form>
	 <iframe id="themeForm" class="iframes" name="uploadframe" style="display:none"></iframe>
	</div> 
	
	    <!--富文本内容， 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script type="text/javascript" src="js/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E( document.getElementById('editor') );
        editor.customConfig.uploadImgServer = '/SSM/test/imgs.do';
        editor.customConfig.debug = true;
     	editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024 ;
		editor.customConfig.colors = ['#000000',];
     	
     	var $text1 = $('#text1')
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $text1.val(html)
    }
         editor.create(); 
         $text1.val(editor.txt.html())
        $('.wenben>img').attr('style','width:200px;');
        
        //封面图回显
        function imgChange(e) {
        console.info(e.target.files[0]);//图片文件
        console.log(e.target.value);//这个也是文件的路径和上面的dom.value是一样的
        var reader = new FileReader();
        reader.onload = (function (file) {
            return function (e) {
                $('.user-header').attr('src',this.result);
            };
        })(e.target.files[0]);
        reader.readAsDataURL(e.target.files[0]);
    }
    
    $('.user-header').click(function () {
        $("#file").click();
    });
    
    //判断表单是否为空
    function ifnull(){
    	if(document.getElementById("file").value=="" ){
    		alert("封面图不能为空")
    		return false;
    	}
    	if(document.getElementById("text").value==""){
    		alert("标题不能为空")
    		return false;
    	}
    	if(document.getElementById("text1").value=="<p><br></p>"){
    		alert("内容不能为空")
    		return false;
    }else{
    	return true;
    	alert("提交成功")
    }
    }
    
    //判断字数
    function checknum(){
    	var le = 30;
    	var num = document.getElementById("text").value;
    	var numle = num.length;
    	$('#a').text("你还能输入"+(le-numle)+"个字"); 
    }
    </script>
	
</div>

</body>

</html>