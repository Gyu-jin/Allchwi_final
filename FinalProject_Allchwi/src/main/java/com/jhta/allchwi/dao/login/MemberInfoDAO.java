package com.jhta.allchwi.dao.login;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.login.MemberInfoVO;


@Repository
public class MemberInfoDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.MemberInfoMapper";
	
	//회원탈퇴정보 업데이트
	public int UpdateSignout(HashMap<String, Object> hm) {
		return session.update(NAMESPACE + ".updateSignout", hm);
	}
	//회원가입시 정보 삽입, 회원가입시에는 회원번호 로그인번호 이미지번호 이름 등록일만
	public int SignIn(MemberInfoVO miv) {
		return session.insert(NAMESPACE + ".addInfo", miv);
	}
	
}
