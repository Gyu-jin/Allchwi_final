package com.jhta.allchwi.service.classapply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classapply.PaymentDAO;
import com.jhta.allchwi.vo.classapply.PaymentVO;

@Service
public class PaymentService {
	@Autowired private PaymentDAO dao;
	
	public int insert(PaymentVO vo) {
		return dao.insert(vo);
	}
}
