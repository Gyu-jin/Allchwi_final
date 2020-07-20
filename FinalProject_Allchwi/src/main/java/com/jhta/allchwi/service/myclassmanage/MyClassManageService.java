package com.jhta.allchwi.service.myclassmanage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.myclassmanage.MyClassManageDAO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.myclassmanage.MyClassManageVO;

@Service
public class MyClassManageService {
	
	@Autowired
	private MyClassManageDAO mcmd;
	
	//a 클래스 신청한 회원 목록 보기
	public List<MyClassManageVO> searchApply(HashMap<String, Object> hm) {
		return mcmd.searchApply(hm);
	}
	//a 개설한 클래스번호 및 타이틀 목록 보기
	public List<ClassInfoVO> searchMyClass(int ml_num) {
		return mcmd.searchMyClass(ml_num);
	}
}
