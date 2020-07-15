package com.jhta.allchwi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.confirmClassDAO;
import com.jhta.allchwi.vo.admin.ConfirmClassVO;

@Service
public class confirmClassService {
	@Autowired
	private confirmClassDAO dao;
	
	public List<ConfirmClassVO> confirm_list(){
		return dao.confirm_list();
	}
	
}
