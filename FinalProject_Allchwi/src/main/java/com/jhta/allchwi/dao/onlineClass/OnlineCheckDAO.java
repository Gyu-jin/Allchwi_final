package com.jhta.allchwi.dao.onlineClass;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.onlineclass.OnlineCheckVO;

@Repository
public class OnlineCheckDAO {
	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "com.jhta.mybatis.mapper.OnlineCheckMapper";

	public int select(OnlineCheckVO vo) {
		return session.selectOne(NAMESPACE + ".select", vo);
	}
	
	public int timeSelect(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE + ".timeSelect", map);
	}
	
	public int insert(OnlineCheckVO vo) {
		return session.insert(NAMESPACE + ".insert", vo);
	}
	
	
}
