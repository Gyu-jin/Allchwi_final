package com.jhta.allchwi.dao.location;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.admin.SmallCategoryVO;
import com.jhta.allchwi.vo.location.SmallLocationVO;

@Repository
public class SmallLocationDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.SmallLocationMapper";
	
	public int insert(SmallLocationVO slocVo) {
		return session.insert(NAMESPACE + ".insert",slocVo );
	}

}
