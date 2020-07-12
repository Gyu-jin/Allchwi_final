package com.jhta.allchwi.service.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.login.MemberInfoDAO;
import com.jhta.allchwi.dao.login.MemberLoginDAO;
import com.jhta.allchwi.dao.point.PointDAO;
import com.jhta.allchwi.dao.profileImg.ProfileImgDAO;
import com.jhta.allchwi.vo.login.MemberLoginVO;

@Service
public class MemberLoginService implements MemberJoinService{
	@Autowired
	private MemberLoginDAO mld;
	
	@Autowired
	private MemberInfoDAO mid;
	
	@Autowired
	private PointDAO pd;
	
	@Autowired
	private ProfileImgDAO pid;
	
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
	//회원가입시 트랜잭션 처리를 위해 인터페이스 상속
	@Override
	public int joinMember(Object data) {
		
		return 1;
	}
	
}
