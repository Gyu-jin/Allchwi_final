package com.jhta.allchwi.dao.classopen;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classopen.ClassDateVO;

@Repository
public class ClassDateDAO {
	@Autowired private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.ClassDateMapper";
	
	public List<ClassDateVO> list(int class_num){
		return session.selectList(NAMESPACE+".list",class_num);
	}

	public int insert(ClassDateVO vo) {
		return session.insert(NAMESPACE + ".insert",vo);
	}
}
