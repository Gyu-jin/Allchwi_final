package com.jhta.allchwi.vo.admin;


// 지금 practice테이블로 연습중
public class ManageClassVO {
	private int ml_num;
	private String tutor_nickname;
	private String class_title;
	private int class_form;
	private String scategory_name; 
	
	public ManageClassVO() {}

	public ManageClassVO(int ml_num, String tutor_nickname, String class_title, int class_form, String scategory_name) {
		super();
		this.ml_num = ml_num;
		this.tutor_nickname = tutor_nickname;
		this.class_title = class_title;
		this.class_form = class_form;
		this.scategory_name = scategory_name;
	}

	public int getMl_num() {
		return ml_num;
	}

	public void setMl_num(int ml_num) {
		this.ml_num = ml_num;
	}

	public String getTutor_nickname() {
		return tutor_nickname;
	}

	public void setTutor_nickname(String tutor_nickname) {
		this.tutor_nickname = tutor_nickname;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	public int getClass_form() {
		return class_form;
	}

	public void setClass_form(int class_form) {
		this.class_form = class_form;
	}

	public String getScategory_name() {
		return scategory_name;
	}

	public void setScategory_name(String scategory_name) {
		this.scategory_name = scategory_name;
	}

	
	
	
}
