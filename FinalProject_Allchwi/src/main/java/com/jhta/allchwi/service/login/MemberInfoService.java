package com.jhta.allchwi.service.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.login.MemberInfoDAO;

@Service
public class MemberInfoService {
	@Autowired
	private MemberInfoDAO mid;
	
	//회원탈퇴정보 업데이트
	public int UpdateSignout(HashMap<String, Object> hm) {
		return mid.UpdateSignout(hm);
	}
}
