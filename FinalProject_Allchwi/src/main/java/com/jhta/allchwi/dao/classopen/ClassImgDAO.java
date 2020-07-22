package com.jhta.allchwi.dao.classopen;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classopen.ClassImgVO;

@Repository
public class ClassImgDAO {
	@Autowired
	SqlSession session;	
	private final String NAMESPACE = "com.jhta.mybatis.mapper.ClassImgMapper";
	
	public int insert(ClassImgVO vo) {
		return session.insert(NAMESPACE + ".insert",vo);
	}

	public ClassImgVO getImg(int cover_num) {
		return session.selectOne(NAMESPACE + ".imgSelect", cover_num);
	}

	public int delete(int cover_num) {
		return session.delete(NAMESPACE + ".delete",cover_num);
	}
	
	
}
