package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassListController {
	
	@GetMapping("/admin/classlist")
	public String classlist() {
		return ".admin.classlist";
	}
	
	
}
