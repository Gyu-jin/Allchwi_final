package com.jhta.allchwi.dao.classdetail;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classdetail.ClassReviewVO;
@Repository
public class ClassReviewDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.ClassReviewMapper";	
	
	public int insertReview(ClassReviewVO vo) {
		return session.insert(NAMESPACE+".insertReview", vo);
	}
	public List<ClassReviewVO> reviewList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".reviewList", map);
	}
	public int rcount(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".rcount", map);
	}
}
