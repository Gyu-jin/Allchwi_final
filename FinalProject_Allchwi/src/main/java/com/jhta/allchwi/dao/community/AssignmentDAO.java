package com.jhta.allchwi.dao.community;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.community.AssignmentVO;

@Repository
public class AssignmentDAO {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.mapper.AssignmentMapper";
	
	public int insert(AssignmentVO vo) {
		return session.insert(NAMESPACE+".insert",vo);
	}
	
	public List<AssignmentVO> list(){
		return session.selectList(NAMESPACE+".list");
	}
	
	public int delete(int assign_num) {
		return session.delete(NAMESPACE+".delete",assign_num);
	}
	
	public AssignmentVO updatelist(int assign_num) {
		return session.selectOne(NAMESPACE+".updatelist",assign_num);
	}
	
	public int update(AssignmentVO vo) {
		return session.update(NAMESPACE+".update",vo);
	}
}
