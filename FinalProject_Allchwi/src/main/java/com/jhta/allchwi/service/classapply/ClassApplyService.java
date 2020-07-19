package com.jhta.allchwi.service.classapply;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.allchwi.dao.classapply.ClassApplyDAO;
import com.jhta.allchwi.dao.classapply.PaymentDAO;
import com.jhta.allchwi.vo.classapply.ClassApplyVO;
import com.jhta.allchwi.vo.classapply.PaymentVO;

@Service
public class ClassApplyService {
	@Autowired private ClassApplyDAO apply_dao;
	@Autowired private PaymentDAO pay_dao;
	
	@Transactional
	public boolean insert(ClassApplyVO vo, PaymentVO pvo) throws Exception{
		// Class_Apply 테이블 insert
		apply_dao.insert(vo);
		
		pvo.setApply_num(vo.getApply_num());
		System.out.println("apply service : apply_num="+vo.getApply_num());
		// Payment 테이블 insert
		pay_dao.insert(pvo);
		
	
		return true;
	}
		
}
