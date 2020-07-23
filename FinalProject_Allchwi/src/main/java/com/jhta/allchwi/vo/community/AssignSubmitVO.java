package com.jhta.allchwi.vo.community;

import java.sql.Timestamp;

public class AssignSubmitVO {
	private int sub_num;
	private int assign_num;
	private int ml_num;
	private String sub_content;
	private Timestamp sub_regdate;
	
	public AssignSubmitVO() {}

	public AssignSubmitVO(int sub_num, int assign_num, int ml_num, String sub_content, Timestamp sub_regdate) {
		super();
		this.sub_num = sub_num;
		this.assign_num = assign_num;
		this.ml_num = ml_num;
		this.sub_content = sub_content;
		this.sub_regdate = sub_regdate;
	}

	public int getSub_num() {
		return sub_num;
	}

	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}

	public int getAssign_num() {
		return assign_num;
	}

	public void setAssign_num(int assign_num) {
		this.assign_num = assign_num;
	}

	public int getMl_num() {
		return ml_num;
	}

	public void setMl_num(int ml_num) {
		this.ml_num = ml_num;
	}

	public String getSub_content() {
		return sub_content;
	}

	public void setSub_content(String sub_content) {
		this.sub_content = sub_content;
	}

	public Timestamp getSub_regdate() {
		return sub_regdate;
	}

	public void setSub_regdate(Timestamp sub_regdate) {
		this.sub_regdate = sub_regdate;
	}
	
	
}
