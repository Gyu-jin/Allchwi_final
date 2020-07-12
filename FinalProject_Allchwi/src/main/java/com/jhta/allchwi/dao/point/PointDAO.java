package com.jhta.allchwi.dao.point;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.point.PointVO;

@Repository
public class PointDAO {
	@Autowired
	SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.PointMapper";
	
	//회원가입시 1000 포인트 추가 
	public int insert(PointVO vo) {
		return session.insert(NAMESPACE + ".addPoint",vo);
	}
}
