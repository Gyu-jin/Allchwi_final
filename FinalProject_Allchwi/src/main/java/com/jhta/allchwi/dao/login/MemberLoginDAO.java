package com.jhta.allchwi.dao.login;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.login.MemberLoginVO;

@Repository
public class MemberLoginDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.MemberLoginMapper";
	//0  회원가입
	public int join(MemberLoginVO mlv) {
		return session.insert(NAMESPACE + ".member_join", mlv);
	}
	//1 id값으로 회원 조회
	public MemberLoginVO idCheck(String id) {
		return session.selectOne(NAMESPACE + ".idCheck", id);
	}
	//2 id값으로 회원 비밀번호 검색하여 변경
	public int searchPwd(HashMap<String, Object> hm) {
		return session.update(NAMESPACE + ".searchPwd", hm);
	}
}
