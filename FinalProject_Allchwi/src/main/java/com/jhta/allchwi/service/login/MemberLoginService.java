package com.jhta.allchwi.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.login.MemberLoginDAO;
import com.jhta.allchwi.vo.login.MemberLoginVO;

@Service
public class MemberLoginService {
	@Autowired
	private MemberLoginDAO mld;
	
	public MemberLoginVO idCheck(String id) {
		return mld.idCheck(id);
	}
}
