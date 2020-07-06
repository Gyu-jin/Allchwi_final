package com.jhta.allchwi.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.big_categoryDao;
import com.jhta.allchwi.vo.admin.big_categoryVo;

@Service
public class big_categoryService {
	@Autowired
	private big_categoryDao dao;
	
	public int insert(big_categoryVo vo) {
		return dao.insert(vo);
	}	
}
