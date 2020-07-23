package com.jhta.allchwi.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.Statistic1VO;

@Repository
public class Statistic1DAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.AdminStatisticMapper";	
															
	public List<Statistic1VO> list(){
		return session.selectList(NAMESPACE+".list");
	}
	
	
	
	
}
