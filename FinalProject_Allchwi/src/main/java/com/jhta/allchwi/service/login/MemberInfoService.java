package com.jhta.allchwi.service.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.login.MemberInfoDAO;
import com.jhta.allchwi.vo.login.MemberInfoVO;

@Service
public class MemberInfoService {
	@Autowired
	private MemberInfoDAO mid;
	
	//1회원탈퇴정보 업데이트
	public int UpdateSignout(HashMap<String, Object> hm) {
		return mid.UpdateSignout(hm);
	}
	//2회원정보 조회
	public MemberInfoVO selectInfo(int ml_num) {
		return mid.selectInfo(ml_num);
	}
}
