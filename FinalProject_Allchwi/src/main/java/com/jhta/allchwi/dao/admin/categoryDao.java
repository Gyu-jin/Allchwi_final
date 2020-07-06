package com.jhta.allchwi.dao.admin;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.big_categoryVo;
import com.jhta.allchwi.vo.admin.small_categoryVo;

@Repository
public class categoryDao {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.AdminCategoryMapper";	
	
	
	public int bcate_insert(big_categoryVo vo) {
		return session.insert(NAMESPACE+".bcate_insert", vo);
	}	
	
	public int scate_insert(small_categoryVo vo) {
		return session.insert(NAMESPACE+".scate_insert", vo);
	}	
	
	

	public List<big_categoryVo> list() {
		return session.selectList(NAMESPACE+".list");
	}


}
