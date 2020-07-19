package com.jhta.allchwi.vo.admin;


public class AdminPaymentVO {
	private int num;
	private String name;
	private	String pwd;
	

	public AdminPaymentVO() {}


	public AdminPaymentVO(int num, String name, String pwd) {
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
