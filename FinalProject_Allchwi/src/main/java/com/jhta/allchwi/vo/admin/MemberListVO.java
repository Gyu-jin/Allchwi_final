package com.jhta.allchwi.vo.admin;

import java.sql.Timestamp;

public class MemberListVO {
	private String id;
	private int mb_num;
	private String mb_name;
	private Timestamp mb_regdate;
	private int mb_auth;
	
	public MemberListVO () {}

	public MemberListVO(String id, int mb_num, String mb_name, Timestamp mb_regdate, int mb_auth) {
		super();
		this.id = id;
		this.mb_num = mb_num;
		this.mb_name = mb_name;
		this.mb_regdate = mb_regdate;
		this.mb_auth = mb_auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMb_num() {
		return mb_num;
	}

	public void setMb_num(int mb_num) {
		this.mb_num = mb_num;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public Timestamp getMb_regdate() {
		return mb_regdate;
	}

	public void setMb_regdate(Timestamp mb_regdate) {
		this.mb_regdate = mb_regdate;
	}

	public int getMb_auth() {
		return mb_auth;
	}

	public void setMb_auth(int mb_auth) {
		this.mb_auth = mb_auth;
	}
	
	
	
}
