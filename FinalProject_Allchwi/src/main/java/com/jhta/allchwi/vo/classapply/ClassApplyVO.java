package com.jhta.allchwi.vo.classapply;

import java.sql.Timestamp;

public class ClassApplyVO {
	private int apply_num;
	private int date_num;
	private int ml_num;
	private int stu_lev;
	private String stu_msg;
	private String sut_phone;
	private int apply_auth;
	private Timestamp apply_regdate;
	private int class_finish; 
	
	public ClassApplyVO() {}

	public ClassApplyVO(int apply_num, int date_num, int ml_num, int stu_lev, String stu_msg, String sut_phone,
			int apply_auth, Timestamp apply_regdate, int class_finish) {
		super();
		this.apply_num = apply_num;
		this.date_num = date_num;
		this.ml_num = ml_num;
		this.stu_lev = stu_lev;
		this.stu_msg = stu_msg;
		this.sut_phone = sut_phone;
		this.apply_auth = apply_auth;
		this.apply_regdate = apply_regdate;
		this.class_finish = class_finish;
	}

	public int getApply_num() {
		return apply_num;
	}

	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}

	public int getDate_num() {
		return date_num;
	}

	public void setDate_num(int date_num) {
		this.date_num = date_num;
	}

	public int getMl_num() {
		return ml_num;
	}

	public void setMl_num(int ml_num) {
		this.ml_num = ml_num;
	}

	public int getStu_lev() {
		return stu_lev;
	}

	public void setStu_lev(int stu_lev) {
		this.stu_lev = stu_lev;
	}

	public String getStu_msg() {
		return stu_msg;
	}

	public void setStu_msg(String stu_msg) {
		this.stu_msg = stu_msg;
	}

	public String getSut_phone() {
		return sut_phone;
	}

	public void setSut_phone(String sut_phone) {
		this.sut_phone = sut_phone;
	}

	public int getApply_auth() {
		return apply_auth;
	}

	public void setApply_auth(int apply_auth) {
		this.apply_auth = apply_auth;
	}

	public Timestamp getApply_regdate() {
		return apply_regdate;
	}

	public void setApply_regdate(Timestamp apply_regdate) {
		this.apply_regdate = apply_regdate;
	}

	public int getClass_finish() {
		return class_finish;
	}

	public void setClass_finish(int class_finish) {
		this.class_finish = class_finish;
	}
	
	
}
