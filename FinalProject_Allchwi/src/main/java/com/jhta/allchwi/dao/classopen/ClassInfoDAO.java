package com.jhta.allchwi.dao.classopen;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Repository
public class ClassInfoDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.ClassInfoMapper";
	
	public int insert(ClassInfoVO vo) {
		return session.insert(NAMESPACE + ".insert",vo);
	}
	
	public List<ClassInfoVO> list(int bcategory_num){
		return session.selectList(NAMESPACE+".list",bcategory_num);
	}
}
