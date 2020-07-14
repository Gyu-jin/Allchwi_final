package com.jhta.allchwi.dao.admin;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.BigCategoryVO;
import com.jhta.allchwi.vo.admin.BigsmallCategoryVO;
import com.jhta.allchwi.vo.admin.ManageClassVO;
import com.jhta.allchwi.vo.admin.SmallCategoryVO;

@Repository
public class categoryDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.CategoryMapper";	
	
	public int bcate_insert(BigCategoryVO vo) {
		return session.insert(NAMESPACE+".bcate_insert", vo);
	}	
	
	public int scate_insert(SmallCategoryVO vo) {
		return session.insert(NAMESPACE+".scate_insert", vo);
	}	
	
	public List<BigsmallCategoryVO> list() {
		return session.selectList(NAMESPACE+".list");
	}

	public List<BigCategoryVO> bcate_list(){
		return session.selectList(NAMESPACE+".bcate_list");
	}
	
	public int del_scate(int scategory_num) {
		return session.delete(NAMESPACE+".del_scate", scategory_num);
	}
	
	public int del_bcate(int bcategory_num) {
		return session.delete(NAMESPACE+".del_bcate", bcategory_num);
	}

	public List<SmallCategoryVO> scate_list(int bcategory_num) {
		
		return session.selectList(NAMESPACE + ".scate_list",bcategory_num);
	}
	public List<SmallCategoryVO> allscate_list() {
		return session.selectList(NAMESPACE + ".allscate_list");
	}
	public String scatename(int scategory_num) {
		return session.selectOne(NAMESPACE+".scatename",scategory_num);
	}
	public String bcatename(int bcategory_num) {
		return session.selectOne(NAMESPACE+".bcatename",bcategory_num);
	}
	
	
	
	
}
