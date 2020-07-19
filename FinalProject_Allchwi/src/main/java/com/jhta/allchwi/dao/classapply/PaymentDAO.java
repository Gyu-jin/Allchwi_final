package com.jhta.allchwi.dao.classapply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.classapply.PaymentVO;

@Repository
public class PaymentDAO {
	@Autowired private SqlSession session;
	private final String NAMESPACE="com.jhta.mybatis.mapper.PaymentMapper";
	
	public int insert(PaymentVO vo) {
		return session.insert(NAMESPACE+".insert",vo);
	}
}
