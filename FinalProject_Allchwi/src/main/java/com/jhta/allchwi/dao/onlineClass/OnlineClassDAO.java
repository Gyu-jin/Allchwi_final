package com.jhta.allchwi.dao.onlineClass;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.community.CommunityVO;
import com.jhta.allchwi.vo.onlineclass.OnlineClassVO;

@Repository
public class OnlineClassDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.OnlineClassMapper";
	public void classInsert(OnlineClassVO vo) {
		session.insert(NAMESPACE + ".insert", vo);
	}
	public List<OnlineClassVO> list(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE + ".list", map);
	}
	public int count(HashMap<String, Object> map) {
		return session.selectOne(NAMESPACE + ".count", map);
	}
	public OnlineClassVO getImg(int online_num) {
		return session.selectOne(NAMESPACE + ".getImg", online_num);
	}
}
