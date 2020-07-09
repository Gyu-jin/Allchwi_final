package com.jhta.allchwi.vo.admin;


// 지금 practice테이블로 연습중
public class manage_classVo {
	private int num;
	private String name;
	private String pwd;
	
	public manage_classVo() {}

	public manage_classVo(int num, String name, String pwd) {
		super();
		this.num = num;
		this.name = name;
		this.pwd = pwd;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	
	
	
	
}
