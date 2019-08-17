package com.student.service;



import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.student.beat.Page;
import com.student.beat.Student;
import com.student.dao.IStudentDao;
@Service("studentService")
public class Studentimpl implements IStudentService {
	
	@Resource(name="IStudentDao")
	private IStudentDao dao;
	
	public Studentimpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setDao(IStudentDao dao) {
		this.dao = dao;
	}


	@Transactional
	public void addStudent(Student student) {
		dao.insertStudent(student);

	}



	@Transactional
	public  List<Student> selectStudents() {
		List<Student> students = dao.selectName();
		return students;
	}

	@Transactional
	public String mapperStudent(String name){
		String studentname = dao.mapperStudent(name);	
		return studentname;	
	}

	@Transactional
	public Student mapperallstudents(Student student) {
		Student students = dao.mapperallstudent(student);
		return students;
	}

	@Transactional
	public List<Student> findIdAll(String name) {
		return dao.findidalll(name);
	}

	@Transactional
	public void addPage(Page page) {
		dao.addpage(page);
		
	}

	@Transactional
	public List<Page> findAllMsg(@Param("jk1")Integer a, @Param("jk2")Integer b) {
		List<Page> msg = dao.findallmsg(a,b);

		return msg;
	}

	@Transactional
	public Integer countNum() {
		// TODO Auto-generated method stub
		return dao.countnum();
	}

	@Transactional
	public void addHtml(String html) {
		dao.addhtml(html);
		
	}

	@Transactional
	public Page xian(Integer finddates) {
		// TODO Auto-generated method stub
		return dao.xiansi(finddates);
	}
	
}