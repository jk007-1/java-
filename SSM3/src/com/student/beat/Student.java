package com.student.beat;

public class Student {
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	private Integer id;
	private String name;
	private int age;
	public Student(String name, int age) {
		super();
		
		this.name = name;
		this.age = age;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String name) {
		super();
		this.name = name;
	}
	public Student(int age) {
		super();
		this.age = age;
	}
	
}
