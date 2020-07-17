package com.jhta.allchwi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.AdminPaymentDAO;
import com.jhta.allchwi.vo.admin.AdminPaymentVO;

@Service
public class AdminPaymentService {
	@Autowired
	private AdminPaymentDAO dao;
	
	public List<AdminPaymentVO> payment_list() {
		return dao.payment_list();
	}
}
