package com.jhta.allchwi.vo.admin;

public class SalesVO {
	private int pay_num;
	private String class_name;
	private String tutor_name;
	private int pay;
	public SalesVO(int pay_num, String class_name, String tutor_name, int pay) {
		super();
		this.pay_num = pay_num;
		this.class_name = class_name;
		this.tutor_name = tutor_name;
		this.pay = pay;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getTutor_name() {
		return tutor_name;
	}
	public void setTutor_name(String tutor_name) {
		this.tutor_name = tutor_name;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	
	
	
	
	
}
