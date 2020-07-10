package com.jhta.allchwi.dao.login;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberInfoDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.MemberInfoMapper";
	
	//회원탈퇴정보 업데이트
	public int UpdateSignout(HashMap<String, Object> hm) {
		return session.update(NAMESPACE + ".update_signout", hm);
	}
}
