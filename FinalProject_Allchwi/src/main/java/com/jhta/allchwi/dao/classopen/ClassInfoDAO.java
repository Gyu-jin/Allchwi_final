package com.jhta.allchwi.dao.classopen;

import java.util.HashMap;
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
	//keyword 검색
	public List<ClassInfoVO> keyword_list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".keyword_list", map);
	}
	
	//category 검색 
	public List<ClassInfoVO> list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".list",map);
	}
	public int count(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE+".count",map);
	}
	public ClassInfoVO getInfo(int class_num) {
		return session.selectOne(NAMESPACE+".getInfo",class_num);
	}
}
