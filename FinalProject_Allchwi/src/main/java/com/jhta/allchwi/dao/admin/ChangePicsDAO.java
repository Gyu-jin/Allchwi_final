package com.jhta.allchwi.dao.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.MainPicsVO;
import com.jhta.allchwi.vo.admin.PicsListVO;

@Repository
public class ChangePicsDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.AdminPicsChangeMapper";	
	
	public int picsInsert(MainPicsVO vo) {
		return session.insert(NAMESPACE+".picsInsert", vo);
	}
	
	public List<PicsListVO> pics_list(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".pics_list",map);
	}
	
	public int count () {
		return session.selectOne(NAMESPACE+".count");
	}
	
	
	public List<String> banner_list() {
		return session.selectList(NAMESPACE+".banner_list");
	}
	
	
	
}
