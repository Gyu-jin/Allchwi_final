package com.jhta.allchwi.dao.community;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.community.AssignDataVO;

@Repository
public class AssignDataDAO {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.mapper.AssignDataMapper";
	
	public int insert(AssignDataVO vo) {
		return session.insert(NAMESPACE+".insert",vo);
	}
	
}
