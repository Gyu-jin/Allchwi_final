package com.jhta.allchwi.dao.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.big_categoryVo;

@Repository
public class big_categoryDao {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.AdminCategoryMapper";	
	
	
	public int insert(big_categoryVo vo) {
		return session.insert(NAMESPACE+".insert", vo);
	}	
}
