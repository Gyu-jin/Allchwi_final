package com.jhta.allchwi.vo.claaopen;

public class CertificateVO {
	private int certif_num; // 자격증 번호
	private int class_num; // 튜터번호
	private String certifSave_name; //파일저장이름
	private String certif_name; //자격증명
	
	public CertificateVO () {}

	public CertificateVO (int certif_num, int class_num, String certifSave_name, String certif_name) {
		super();
		this.certif_num = certif_num;
		this.class_num = class_num;
		this.certifSave_name = certifSave_name;
		this.certif_name = certif_name;
	}

	public int getCertif_num() {
		return certif_num;
	}

	public void setCertif_num(int certif_num) {
		this.certif_num = certif_num;
	}

	public int getClass_num() {
		return class_num;
	}

	public void setClass_num(int class_num) {
		this.class_num = class_num;
	}

	public String getCertifSave_name() {
		return certifSave_name;
	}

	public void setCertifSave_name(String certifSave_name) {
		this.certifSave_name = certifSave_name;
	}

	public String getCertif_name() {
		return certif_name;
	}

	public void setCertif_name(String certif_name) {
		this.certif_name = certif_name;
	}

}
