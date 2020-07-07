package com.jhta.allchwi.dao.admin;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.big_categoryVo;
import com.jhta.allchwi.vo.admin.bigsmall_categoryVo;
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
	
	public List<bigsmall_categoryVo> list() {
		return session.selectList(NAMESPACE+".list");
	}

	public List<big_categoryVo> bcate_list(){
		return session.selectList(NAMESPACE+".bcate_list");
	}
	
	public int del_cate(int scategory_num) {
		return session.delete(NAMESPACE+".del_cate", scategory_num);
	}
	
	public int del_bcate(int bcategory_num) {
		return session.delete(NAMESPACE+".del_bcate", bcategory_num);
	}
	
	
	
}
