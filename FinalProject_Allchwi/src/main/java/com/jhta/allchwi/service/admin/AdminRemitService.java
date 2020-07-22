package com.jhta.allchwi.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.AdminRemitDAO;
import com.jhta.allchwi.vo.admin.AdminRemitVO;

@Service
public class AdminRemitService {
	@Autowired
	private AdminRemitDAO dao;
	
	public List<AdminRemitVO> remit_list(HashMap<String, Object> map){
		return dao.remit_list(map);
	}
	
	public int count() {
		return dao.count();
	}
	
	public int accept(int pay_num) {
		return dao.accpet(pay_num);
	}
	
	
}
