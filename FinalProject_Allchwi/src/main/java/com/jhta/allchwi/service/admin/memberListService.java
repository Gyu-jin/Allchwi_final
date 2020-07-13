package com.jhta.allchwi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.memberListDAO;
import com.jhta.allchwi.vo.admin.MemberListVO;

@Service
public class memberListService {
	@Autowired
	private memberListDAO dao;
	
	public List<MemberListVO> member_list(){
		return dao.member_list();
	}
	
}
