package com.student.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.student.beat.Page;
import com.student.beat.Student;

public interface IStudentDao {

	void insertStudent(Student student);
	List<Student>selectName();
	String mapperStudent(String name);
	Student mapperallstudent(Student student);
	List<Student> findidalll(String name);
	
	void addpage(Page page);
	List<Page> findallmsg(@Param("jk1")Integer a, @Param("jk2")Integer b);
	Integer countnum();
	void addhtml(String html);
	Page xiansi(@Param("finddates")Integer finddates);
	
	
}
