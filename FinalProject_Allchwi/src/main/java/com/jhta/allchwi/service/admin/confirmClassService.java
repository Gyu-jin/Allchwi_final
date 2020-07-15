package com.jhta.allchwi.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.confirmClassDAO;
import com.jhta.allchwi.vo.admin.ConfirmClassVO;

@Service
public class confirmClassService {
	@Autowired
	private confirmClassDAO dao;
	
	public List<ConfirmClassVO> confirm_list(HashMap<String, Object> map){
		return dao.confirm_list(map);
	}
	
	public int count(HashMap<String, Object> map) {
		return dao.count(map);
	}
	
	public int acceptClass(int class_num) {
		return dao.acceptClass(class_num);
	}
	
	
}
