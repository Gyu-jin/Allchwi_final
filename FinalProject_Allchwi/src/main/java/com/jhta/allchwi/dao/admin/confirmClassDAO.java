package com.jhta.allchwi.dao.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.ConfirmClassVO;

@Repository
public class confirmClassDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.AdminConfirmClassMapper";	
	
	public List<ConfirmClassVO> confirm_list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".confirm_list",map);
	}
	
	
	public int count(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".count",map);
	}
	
	
	public int acceptClass(int class_num) {
		return session.update(NAMESPACE+".acceptClass", class_num);
	}
	
	
}
