package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminCategory {
	
	@GetMapping("/admin/category")
	public String adminMain() {
		return ".admin.category";
	}
	
}
