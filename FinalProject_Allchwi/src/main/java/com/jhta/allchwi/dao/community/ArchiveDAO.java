package com.jhta.allchwi.dao.community;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.community.archive.ArchiveVO;

@Repository
public class ArchiveDAO {
	@Autowired
	private SqlSession session;
	private String NAMESPACE="com.jhta.mybatis.mapper.CommunityArchiveMapper";
	
	
	public List<ArchiveVO> list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".list",map);
	}
	
	public int count() {
		return session.selectOne(NAMESPACE+".count");
	}
	
}
