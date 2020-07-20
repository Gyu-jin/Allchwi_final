package com.jhta.allchwi.dao.myclassmanage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.myclassmanage.MyClassManageVO;

@Repository
public class MyClassManageDAO {
	
	@Autowired
	SqlSession session;
	
	private final String NAMESPACE = "com.jhta.mybatis.mapper.MyClassManageMapper";
	
	//a 회원 클래스 신청서 목록 보기 
	public List<MyClassManageVO> searchApply(HashMap<String, Object> hm) {
		return session.selectList(NAMESPACE + ".MyClassManage", hm);
	}
	//a 개설한 강좌번호 및 타이틀 가져오기
	public List<ClassInfoVO> searchMyClass(int ml_num) {
		return session.selectList(NAMESPACE + ".myClass", ml_num);
	}
	
}
