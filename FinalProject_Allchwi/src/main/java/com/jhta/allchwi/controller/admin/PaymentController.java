package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
	@GetMapping("/admin/payment")
	public String goPayment() {
		return ".admin.payment";
	}
	
	
	
}
