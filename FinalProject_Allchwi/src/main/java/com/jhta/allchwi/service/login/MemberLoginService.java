package com.jhta.allchwi.service.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.login.MemberLoginDAO;
import com.jhta.allchwi.vo.login.MemberLoginVO;

@Service
public class MemberLoginService {
	@Autowired
	private MemberLoginDAO mld;
	//아이디 중복확인
	public MemberLoginVO idCheck(String id) {
		return mld.idCheck(id);
	}
	//현재 비밀번호 일치 여부 확인
	public MemberLoginVO checkPwd(HashMap<String, Object> hm) {
		return mld.checkPwd(hm);
	}
	//현재 비밀번호, 아이디로 비밀번호 업데이트
	public int changePwd(HashMap<String, Object> hm) {
		return mld.changePwd(hm);
	}
	
}
