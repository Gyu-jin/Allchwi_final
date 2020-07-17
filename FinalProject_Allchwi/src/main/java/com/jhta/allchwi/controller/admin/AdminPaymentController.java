package com.jhta.allchwi.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.admin.AdminPaymentService;
import com.jhta.allchwi.vo.admin.AdminPaymentVO;

@Controller
public class AdminPaymentController {
	@Autowired
	private AdminPaymentService service;
	
	@GetMapping("/admin/payment")
	public String goPayment(Model model) {
		List<AdminPaymentVO> list = service.payment_list();
		model.addAttribute("list", list);
		return ".admin.payment";
	}
	
	
	
}
