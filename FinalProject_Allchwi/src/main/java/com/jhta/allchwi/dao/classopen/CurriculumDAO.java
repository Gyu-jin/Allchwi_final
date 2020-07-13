package com.jhta.allchwi.dao.classopen;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classopen.CurriculumVO;

@Repository
public class CurriculumDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.CuriiculumMapper";
	
	public int insert(CurriculumVO vo) {
		return session.insert(NAMESPACE +".insert",vo);
	}
}
