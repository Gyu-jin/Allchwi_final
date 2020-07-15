package com.jhta.allchwi.dao.classapply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classapply.ClassApplyVO;

@Repository
public class ClassApplyDAO {
	@Autowired private SqlSession session;
	private String NAMESPACE="com.jhta.mybatis.mapper.ClassApplyMapper";
	
	public int insert(ClassApplyVO vo) {
		return session.insert(NAMESPACE+".insert",vo);
	}
}
