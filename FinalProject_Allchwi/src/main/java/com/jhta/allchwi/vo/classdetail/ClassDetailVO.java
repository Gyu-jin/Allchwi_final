package com.jhta.allchwi.vo.classdetail;

import com.jhta.allchwi.vo.classopen.CertificateVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.classopen.CurriculumVO;


public class ClassDetailVO {
	private ClassInfoVO classInfo;
	private CertificateVO cert;
	private CurriculumVO classCurri;
	public ClassDetailVO() {};
	public ClassDetailVO(ClassInfoVO classInfo, CertificateVO cert, CurriculumVO classCurri) {
		super();
		this.classInfo = classInfo;
		this.cert = cert;
		this.classCurri = classCurri;
	}
	public ClassInfoVO getClassInfo() {
		return classInfo;
	}
	public void setClassInfo(ClassInfoVO classInfo) {
		this.classInfo = classInfo;
	}
	public CertificateVO getCert() {
		return cert;
	}
	public void setCert(CertificateVO cert) {
		this.cert = cert;
	}
	public CurriculumVO getClassCurri() {
		return classCurri;
	}
	public void setClassCurri(CurriculumVO classCurri) {
		this.classCurri = classCurri;
	}
	
}
