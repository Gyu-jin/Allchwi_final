package com.jhta.allchwi.dao.community;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AssignDataDAO {
	@Autowired private SqlSession session;
}
