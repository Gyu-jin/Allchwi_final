package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassManageController {
	@GetMapping("/admin/manageClass")
	public String classlist() {
		return ".admin.manageClass";
	}
}
