package com.jhta.allchwi.vo.community.archive;

import java.sql.Timestamp;

public class ArchiveVO {
	private int room_num;
	private int comu_num;
	private String room_title;
	private String room_content;
	private Timestamp room_regdate;
	private int room_view;
	private String horsehead;
	public ArchiveVO(int room_num, int comu_num, String room_title, String room_content, Timestamp room_regdate,
			int room_view, String horsehead) {
		super();
		this.room_num = room_num;
		this.comu_num = comu_num;
		this.room_title = room_title;
		this.room_content = room_content;
		this.room_regdate = room_regdate;
		this.room_view = room_view;
		this.horsehead = horsehead;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getComu_num() {
		return comu_num;
	}
	public void setComu_num(int comu_num) {
		this.comu_num = comu_num;
	}
	public String getRoom_title() {
		return room_title;
	}
	public void setRoom_title(String room_title) {
		this.room_title = room_title;
	}
	public String getRoom_content() {
		return room_content;
	}
	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}
	public Timestamp getRoom_regdate() {
		return room_regdate;
	}
	public void setRoom_regdate(Timestamp room_regdate) {
		this.room_regdate = room_regdate;
	}
	public int getRoom_view() {
		return room_view;
	}
	public void setRoom_view(int room_view) {
		this.room_view = room_view;
	}
	public String getHorsehead() {
		return horsehead;
	}
	public void setHorsehead(String horsehead) {
		this.horsehead = horsehead;
	}
	
	
	
}
