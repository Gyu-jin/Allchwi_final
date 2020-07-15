package com.jhta.allchwi.vo.classopen;

import java.sql.Timestamp;

public class ClassDateVO {
	private int date_num;
	private int class_num;
	private Timestamp class_date;
	private Timestamp class_startTime;
	private Timestamp class_endDate;
	private String class_comment;
	private String class_msg;
	private Timestamp date_regdate;
	private String class_title; // 추가 (class_info)
	
	public ClassDateVO() {}

	public ClassDateVO(int date_num, int class_num, Timestamp class_date, Timestamp class_startTime,
			Timestamp class_endDate, String class_comment, String class_msg, Timestamp date_regdate) {
		super();
		this.date_num = date_num;
		this.class_num = class_num;
		this.class_date = class_date;
		this.class_startTime = class_startTime;
		this.class_endDate = class_endDate;
		this.class_comment = class_comment;
		this.class_msg = class_msg;
		this.date_regdate = date_regdate;
	}

	public int getDate_num() {
		return date_num;
	}

	public void setDate_num(int date_num) {
		this.date_num = date_num;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}

	public Timestamp getClass_date() {
		return class_date;
	}

	public void setClass_date(Timestamp class_date) {
		this.class_date = class_date;
	}

	public Timestamp getClass_startTime() {
		return class_startTime;
	}

	public void setClass_startTime(Timestamp class_startTime) {
		this.class_startTime = class_startTime;
	}

	public Timestamp getClass_endDate() {
		return class_endDate;
	}

	public void setClass_endDate(Timestamp class_endDate) {
		this.class_endDate = class_endDate;
	}

	public String getClass_comment() {
		return class_comment;
	}

	public void setClass_comment(String class_comment) {
		this.class_comment = class_comment;
	}

	public String getClass_msg() {
		return class_msg;
	}

	public void setClass_msg(String class_msg) {
		this.class_msg = class_msg;
	}

	public Timestamp getDate_regdate() {
		return date_regdate;
	}

	public void setDate_regdate(Timestamp date_regdate) {
		this.date_regdate = date_regdate;
	}

	public String getClass_title() {
		return class_title;
	}

	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}

	
	
	
	
}
