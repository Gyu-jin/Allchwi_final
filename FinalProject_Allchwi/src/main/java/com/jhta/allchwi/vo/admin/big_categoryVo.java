package com.jhta.allchwi.vo.admin;

public class big_categoryVo {
	private int bcategory_num;
	private String bcategory_name;
	
	public big_categoryVo() {}

	public big_categoryVo(int bcategory_num, String bcategory_name) {
		super();
		this.bcategory_num = bcategory_num;
		this.bcategory_name = bcategory_name;
	}

	public int getBcategory_num() {
		return bcategory_num;
	}

	public void setBcategory_num(int bcategory_num) {
		this.bcategory_num = bcategory_num;
	}

	public String getBcategory_name() {
		return bcategory_name;
	}

	public void setBcategory_name(String bcategory_name) {
		this.bcategory_name = bcategory_name;
	}
}
