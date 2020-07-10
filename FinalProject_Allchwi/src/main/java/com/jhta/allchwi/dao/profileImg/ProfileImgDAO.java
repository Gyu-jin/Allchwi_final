package com.jhta.allchwi.dao.profileImg;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.profileImg.ProfileImgVO;

@Repository
public class ProfileImgDAO {
	@Autowired
	SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.ProfileImgMapper";
	
	public int insert(ProfileImgVO vo) {
		return session.insert(NAMESPACE + ".insert",vo);
	}
	
}
