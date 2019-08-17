package com.student.handle;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.student.beat.Page;
import com.student.beat.Student;
import com.student.service.IStudentService;

@Controller
@RequestMapping(value="/test")
public class StudentController{
	@Autowired
	@Qualifier("studentService")
	private IStudentService service;
	public void setService(IStudentService service){
		this.service = service;
	}
	
	public StudentController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//用户注册登记用户名和密码
	@RequestMapping(value="/register.do")
	public String handleRequest(String name,int age){
			Student student = new Student(name,age);
			service.addStudent(student);
			return "/index.jsp" ;
	}
	 

	
	//注册自动查询是否已被注册
	@RequestMapping(value="/all.do")
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		//获取客户端的数据
		String name = request.getParameter("name");
		String username = service.mapperStudent(name);
		Map<String,Object> map = new HashMap<String,Object>();
			if(name.equals(username)){				
				map.put("tf",false);
			}else{
				map.put("tf",true);
			}
	
		//转化成json格式并响应到客户端
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), map);
	}
	//验证登录
	@RequestMapping(value="/mapper.do")
	public void mapper(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		//获取客户端的数据
		String name = request.getParameter("name");
		String ages = request.getParameter("age");
		Integer age = Integer.valueOf(ages);
		Map<String,Object> map = new HashMap<String,Object>();
		Student student = new Student(name,age);    //匹配输入的用户信息
		Student mappeall = service.mapperallstudents(student);
		if(mappeall!=null){	
				map.put("boll", true);	
			}else{
				map.put("boll", false);
			}		
		
		/*System.out.println(map);*/
		//转化成json格式并响应到客户端
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), map);
	}
	
	//图文上传，addpage
	@RequestMapping(value="/loading.do")
	@ResponseBody
	public String loadingImg(HttpServletRequest request,HttpServletResponse response) throws FileUploadException, UnsupportedEncodingException{		
				String filePath = request.getServletContext().getRealPath("img");
				
				//判断图片是否为空
				if(filePath==null){
					System.out.println("kong");
				}
			/*	 "G:/chenxu/java/hjh/SSM3/WebRoot/img"; */
				DiskFileItemFactory factory=new DiskFileItemFactory();
				ServletFileUpload upload=new ServletFileUpload(factory);
				request.setCharacterEncoding("utf-8");
		        //文件名中文乱码处理也可以如此写
		        upload.setHeaderEncoding("utf-8");
		        //设置缓冲区大小与临时文件目录
		        factory.setSizeThreshold(1024*1024*10);
		        File uploadTemp=new File("E:\\uploadTemp");
		        uploadTemp.mkdirs();
		        factory.setRepository(uploadTemp);
		 
		        //设置单个文件大小限制
		        upload.setFileSizeMax(1024*1024*10);
		        //设置所有文件总和大小限制
		        upload.setSizeMax(1024*1024*30);
		        try {

				//
		        	
				List<FileItem> list=upload.parseRequest(request);
				FileItem fileupload = list.get(0);
				String filName=fileupload.getName();
				String rom = filePath ;
				//获取文件后缀名
                String suffix=filName.substring(filName.lastIndexOf("."));
                String part = getUUID()+suffix;
				File trargetFile = new File(rom); 
				
				if (!trargetFile.exists()) {            
					trargetFile.mkdirs();     //没存在文件夹，创建文件夹   
				}  
				/*FileOutputStream out = new FileOutputStream(rom); */ //存在文件夹，创建文件  
				//写入文件到磁盘，该行执行完毕后，若有该临时文件，将会自动删除
				fileupload.write(new File(rom,part));

					
				
				//
				FileItem texts = list.get(1);
				
				String test = texts.getString("UTF-8");
						HttpSession session = request.getSession(false);
						System.out.println(session.getAttribute("students"));
						Integer id =  (Integer) session.getAttribute("students");

				
				String img = "img/"+part;
				FileItem htm = list.get(2);
				String html = htm.getString("UTF-8");
				System.out.println(html);
				Page page = new Page(id,img,test,html);
				System.out.println(page);
				service.addPage(page);
		        }  catch (Exception e) {
		            e.printStackTrace();
		        }
			          
			// TODO: handle exception        
	
			return "/index.jsp" ;
	}
	public static String getUUID(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString(); 
        String uuidStr=str.replace("-", "");
        return uuidStr;
      }
	
	//查询某用户的所有信息
	@RequestMapping(value="/massage.do")
	public  List<Student> id(HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException{
		String name = request.getParameter("name");
		List<Student> student = service.findIdAll(name);
		HttpSession session = request.getSession();
		session.setAttribute("students", student.get(0).getId());
		System.out.println(student.get(0).getId());
		
		return student;
	}
	//获取图文
	@RequestMapping(value="/msg.do")
	public void msg(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		String current = request.getParameter("current_page");
		Integer current1 = Integer.valueOf(current);
		String per = request.getParameter("per_num");
		Integer b = Integer.valueOf(per);
		Integer a = (current1-1)*b;
		System.out.println(b);
		List<Page> msg = service.findAllMsg(a,b);
		Map<String,Object> map = new HashMap<String,Object>();
		List<String> imgs = new LinkedList<String>();
		/*List<String> text = new LinkedList<String>();*/
		for(Page img:msg){
			/*String imgpath = img.getImg();*/
			imgs.add(img.getImg());
			imgs.add(img.getTest());
/*			String test = img.getTest();
			text.add(test);*/
		}
/*		map.put("imgt",imgs);
		map.put("test",text);*/
		
		map.put("all",imgs);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), map);

	}
	
	//数据库总数
	@RequestMapping(value="/num.do")
	public void num(HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		Integer num = service.countNum();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("num",num);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), map);
	}
	
	//帖子图片的存储
	@RequestMapping(value="/imgs.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public void Img(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{		
				String filePath = request.getServletContext().getRealPath("img");
			
			/*	 "G:/chenxu/java/hjh/SSM3/WebRoot/img"; */
				DiskFileItemFactory factory=new DiskFileItemFactory();
				ServletFileUpload upload=new ServletFileUpload(factory);
				request.setCharacterEncoding("utf-8");
		        //文件名中文乱码处理也可以如此写
		        upload.setHeaderEncoding("utf-8");
		        //设置缓冲区大小与临时文件目录
		        factory.setSizeThreshold(1024*1024*10);
		        File uploadTemp=new File("E:\\uploadTemp");
		        uploadTemp.mkdirs();
		        factory.setRepository(uploadTemp);
		 
		        //设置单个文件大小限制
		        upload.setFileSizeMax(1024*1024*10);
		        //设置所有文件总和大小限制
		        upload.setSizeMax(1024*1024*30);
		        try {

				//
		        	
				List<FileItem> list=upload.parseRequest(request);
				FileItem fileupload = list.get(0);
				String filName=fileupload.getName();
				String rom = filePath ;
				//获取文件后缀名
                String suffix=filName.substring(filName.lastIndexOf("."));
                String part = getUUID()+suffix;
				File trargetFile = new File(rom); 
				
				if (!trargetFile.exists()) {            
					trargetFile.mkdirs();     //没存在文件夹，创建文件夹   
				}  
				/*FileOutputStream out = new FileOutputStream(rom); */ //存在文件夹，创建文件  
				//写入文件到磁盘，该行执行完毕后，若有该临时文件，将会自动删除
				fileupload.write(new File(rom,part));
				//获取图片url地址
				String []  imgUrl ={request.getContextPath() + "/img/" + part};
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("errno","0");
				map.put("data",imgUrl);
				
				ObjectMapper mapper = new ObjectMapper();
				mapper.writeValue(response.getWriter(), map);
				response.setContentType("text/text;charset=utf-8");
		        }
				catch (Exception e) {
		            e.printStackTrace();
		        }
	
}
	
	//富文本中HTML存储
	@RequestMapping(value="/htm.do")
	public void tiezi(HttpServletRequest request){
		String html = request.getParameter("htm");
		service.addHtml(html);
	}
	
	//获取标题和图文
	@RequestMapping(value="/xiansi.do")
	public void xiansi(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException{
		String finddate = request.getParameter("finddata");
		Integer finddates = Integer.valueOf(finddate);
		Page ALL = service.xian(finddates);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("title",ALL.getTest());
		map.put("page",ALL.getHtml());
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), map);
	}
}
	

