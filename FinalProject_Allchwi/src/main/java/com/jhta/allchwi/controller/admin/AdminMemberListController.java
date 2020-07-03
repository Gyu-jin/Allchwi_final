package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminMemberListController {
	@GetMapping("/admin/memberlist")
	public String adminMain() {
		return ".admin.memberlist";
	}
}
