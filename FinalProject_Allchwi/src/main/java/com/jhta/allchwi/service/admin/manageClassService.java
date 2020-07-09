package com.jhta.allchwi.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.manageClassDao;
import com.jhta.allchwi.vo.admin.manage_classVo;

@Service
public class manageClassService {
	@Autowired
	private manageClassDao dao;
	
	public List<manage_classVo> manage_list(HashMap<String, Object> map){
		return dao.manage_list(map);
	}
	
	public int count() {
		return dao.count();
	}
	
	
}
