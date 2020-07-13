package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RemitController {
	

	@GetMapping("/admin/remit")
	public String goPayment() {
		return ".admin.remit";
	}
}
