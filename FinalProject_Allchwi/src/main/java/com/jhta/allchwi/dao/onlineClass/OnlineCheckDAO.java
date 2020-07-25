package com.jhta.allchwi.dao.onlineClass;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OnlineCheckDAO {
	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "com.jhta.mybatis.mapper.OnlineCheckMapper";
	
	
}
