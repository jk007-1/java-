package com.student.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.student.beat.Page;
import com.student.beat.Student;

public interface IStudentService {
	 void addStudent(Student student);
	 List<Student> selectStudents();
	 String mapperStudent(String name);
	 Student mapperallstudents(Student student);
	List<Student> findIdAll(String name);
	
	void addPage(Page page);
	List<Page> findAllMsg(@Param("jk1")Integer a, @Param("jk2")Integer b);
	Integer countNum();
	void addHtml(String html);
	Page xian(Integer finddates);
}
