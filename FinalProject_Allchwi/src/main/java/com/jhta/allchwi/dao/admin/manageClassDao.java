package com.jhta.allchwi.dao.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.manage_classVo;

@Repository
public class manageClassDao {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.AdminManageClassMapper";	
	
	public List<manage_classVo> manage_list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".manage_list",map);
	}
	
	public int count() {
		return session.selectOne(NAMESPACE+".count");
	}
	
	
}
