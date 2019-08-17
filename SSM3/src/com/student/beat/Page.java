package com.student.beat;

public class Page {

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	@Override
	public String toString() {
		return "Page [id=" + id + ", img=" + img + ", test=" + test + ", html=" + html + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	private Integer id;
	
	private String img;
	
	private String test;
	
	private String html; 

	public Page(Integer id, String img, String test,String html) {
		super();
		this.id = id;
		this.img = img;
		this.test = test;
		this.html = html;
	}

	public Page(String html) {
		super();
		this.html = html;
	}

	public Page() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
