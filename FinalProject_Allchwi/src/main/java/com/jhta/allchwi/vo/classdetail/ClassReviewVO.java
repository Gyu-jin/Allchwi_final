package com.jhta.allchwi.vo.classdetail;

import java.sql.Timestamp;

import com.jhta.allchwi.vo.login.MemberInfoVO;
import com.jhta.allchwi.vo.login.ProfileVO;

public class ClassReviewVO {
	private int review_num;
	private int class_num;
	private int ml_num;   
	private int curr_rating;   
	private int ready_rating;   
	private int kind_rating;      
	private int time_rating;      
	private String review_content;
	private int review_status;
	private ProfileVO pfv;
	private MemberInfoVO miv;
	private Timestamp review_regdate;
	public ClassReviewVO () {};
	public ClassReviewVO(int review_num, int class_num, int ml_num, int curr_rating, int ready_rating, int kind_rating,
			int time_rating, String review_content, int review_status, ProfileVO pfv, MemberInfoVO miv,
			Timestamp review_regdate) {
		super();
		this.review_num = review_num;
		this.class_num = class_num;
		this.ml_num = ml_num;
		this.curr_rating = curr_rating;
		this.ready_rating = ready_rating;
		this.kind_rating = kind_rating;
		this.time_rating = time_rating;
		this.review_content = review_content;
		this.review_status = review_status;
		this.pfv = pfv;
		this.miv = miv;
		this.review_regdate = review_regdate;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getClass_num() {
		return class_num;
	}
	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}
	public int getMl_num() {
		return ml_num;
	}
	public void setMl_num(int ml_num) {
		this.ml_num = ml_num;
	}
	public int getCurr_rating() {
		return curr_rating;
	}
	public void setCurr_rating(int curr_rating) {
		this.curr_rating = curr_rating;
	}
	public int getReady_rating() {
		return ready_rating;
	}
	public void setReady_rating(int ready_rating) {
		this.ready_rating = ready_rating;
	}
	public int getKind_rating() {
		return kind_rating;
	}
	public void setKind_rating(int kind_rating) {
		this.kind_rating = kind_rating;
	}
	public int getTime_rating() {
		return time_rating;
	}
	public void setTime_rating(int time_rating) {
		this.time_rating = time_rating;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_status() {
		return review_status;
	}
	public void setReview_status(int review_status) {
		this.review_status = review_status;
	}
	public ProfileVO getPfv() {
		return pfv;
	}
	public void setPfv(ProfileVO pfv) {
		this.pfv = pfv;
	}
	public MemberInfoVO getMiv() {
		return miv;
	}
	public void setMiv(MemberInfoVO miv) {
		this.miv = miv;
	}
	public Timestamp getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Timestamp review_regdate) {
		this.review_regdate = review_regdate;
	}
	
	
}
