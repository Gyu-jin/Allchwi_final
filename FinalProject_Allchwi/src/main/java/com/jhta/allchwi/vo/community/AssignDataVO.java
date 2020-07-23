package com.jhta.allchwi.vo.community;

public class AssignDataVO {
	private int assigndata_num;
	private int sub_num;
	private String assign_orgFilename;
	private String assign_saveFilename;
	
	public AssignDataVO() {}

	public AssignDataVO(int assigndata_num, int sub_num, String assign_orgFilename, String assign_saveFilename) {
		super();
		this.assigndata_num = assigndata_num;
		this.sub_num = sub_num;
		this.assign_orgFilename = assign_orgFilename;
		this.assign_saveFilename = assign_saveFilename;
	}

	public int getAssigndata_num() {
		return assigndata_num;
	}

	public void setAssigndata_num(int assigndata_num) {
		this.assigndata_num = assigndata_num;
	}

	public int getSub_num() {
		return sub_num;
	}

	public void setSub_num(int sub_num) {
		this.sub_num = sub_num;
	}

	public String getAssign_orgFilename() {
		return assign_orgFilename;
	}

	public void setAssign_orgFilename(String assign_orgFilename) {
		this.assign_orgFilename = assign_orgFilename;
	}

	public String getAssign_saveFilename() {
		return assign_saveFilename;
	}

	public void setAssign_saveFilename(String assign_saveFilename) {
		this.assign_saveFilename = assign_saveFilename;
	}
	
	
}
