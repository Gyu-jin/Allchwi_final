package com.jhta.allchwi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.categoryDAO;
import com.jhta.allchwi.vo.admin.BigCategoryVO;
import com.jhta.allchwi.vo.admin.BigsmallCategoryVO;
import com.jhta.allchwi.vo.admin.ManageClassVO;
import com.jhta.allchwi.vo.admin.SmallCategoryVO;

@Service
public class categoryService {
	@Autowired
	private categoryDAO dao;
	
	public int bcate_insert(BigCategoryVO vo) {
		return dao.bcate_insert(vo);
	}	
	
	public int scate_insert(SmallCategoryVO vo) {
		return dao.scate_insert(vo);
	}
	

	public List<BigsmallCategoryVO> list(){
		return dao.list();
	}
	
	public List<BigCategoryVO> bcate_list(){
		return dao.bcate_list();
	}
	
	
	public int del_scate(int scategory_num) {
		return dao.del_scate(scategory_num);
	}
	
	public int del_bcate(int bcategory_num) {
		return dao.del_bcate(bcategory_num);
	}
	
	
	
}
