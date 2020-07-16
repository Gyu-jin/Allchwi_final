package com.jhta.allchwi.dao.classdetail;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jhta.allchwi.vo.classqna.ClassQnaVO;

@Repository
public class ClassQnaDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.ClassQnaMapper";	
	
	public int insertQna(ClassQnaVO vo) {
		return session.insert(NAMESPACE+".insertQna", vo);
	}
	public int insertReply(ClassQnaVO vo) {
		return session.insert(NAMESPACE+".insertReply", vo);
	}
	public List<ClassQnaVO> qnaList(int class_num) {
		return session.selectList(NAMESPACE+".qnalist", class_num);
	}
	public List<ClassQnaVO> commList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE+".commlist", map);
	}
	
}
