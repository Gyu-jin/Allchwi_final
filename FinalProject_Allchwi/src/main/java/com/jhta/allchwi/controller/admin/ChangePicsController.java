package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChangePicsController {
	
	@GetMapping("admin/changePics")
	public String changePics() {
		
		return ".admin.changePics";
	}
	
	
	
}
