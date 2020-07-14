package com.jhta.allchwi.dao.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.ManageClassVO;

@Repository
public class manageClassDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.AdminManageClassMapper";	
	
	public List<ManageClassVO> manage_list(){
		return session.selectList(NAMESPACE+".manage_list");
	}
	
	public int countPeople(int class_num) {
		return session.selectOne(NAMESPACE+".countPeople", class_num);
	}
	
	
	/*
	public int count(HashMap<String, Object> map ) {
		return session.selectOne(NAMESPACE+".count",map);
	}
	*/
	
	
}
