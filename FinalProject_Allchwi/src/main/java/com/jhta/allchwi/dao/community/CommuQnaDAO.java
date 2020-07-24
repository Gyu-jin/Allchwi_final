package com.jhta.allchwi.dao.community;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.community.CommuQnaVO;
@Repository
public class CommuQnaDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.CommunityQnaMapper";	
	
	public int insertQna(CommuQnaVO vo) {
		return session.insert(NAMESPACE+".insertQna", vo);
	}
	public int insertReply(CommuQnaVO vo) {
		return session.insert(NAMESPACE+".insertReply", vo);
	}
	public List<CommuQnaVO> qnaList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".qnalist", map);
	}
	public List<CommuQnaVO> commList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".commlist", map);
	}
	public int count(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".count",map);
	}
}
