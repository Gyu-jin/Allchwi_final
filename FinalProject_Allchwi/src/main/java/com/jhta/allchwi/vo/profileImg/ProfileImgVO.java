package com.jhta.allchwi.vo.profileImg;

import java.sql.Blob;

public class ProfileImgVO {
	private int pro_num;
	private Blob pro_img;
	
	public ProfileImgVO() {}

	public ProfileImgVO(int pro_num, Blob pro_img) {
		super();
		this.pro_num = pro_num;
		this.pro_img = pro_img;
	}

	public int getPro_num() {
		return pro_num;
	}

	public void setPro_num(int pro_num) {
		this.pro_num = pro_num;
	}

	public Blob getPro_img() {
		return pro_img;
	}

	public void setPro_img(Blob pro_img) {
		this.pro_img = pro_img;
	}	
}
