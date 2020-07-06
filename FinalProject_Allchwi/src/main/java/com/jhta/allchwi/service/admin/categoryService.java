package com.jhta.allchwi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.categoryDao;
import com.jhta.allchwi.vo.admin.big_categoryVo;
import com.jhta.allchwi.vo.admin.small_categoryVo;

@Service
public class categoryService {
	@Autowired
	private categoryDao dao;
	
	public int bcate_insert(big_categoryVo vo) {
		return dao.bcate_insert(vo);
	}	
	
	public int scate_insert(small_categoryVo vo) {
		return dao.scate_insert(vo);
	}
	
	
	
	public List<big_categoryVo> list(){
		return dao.list();
	}
	
	
	
}
