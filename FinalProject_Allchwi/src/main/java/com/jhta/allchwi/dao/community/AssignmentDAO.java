package com.jhta.allchwi.dao.community;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AssignmentDAO {
	@Autowired private SqlSession session;
}
