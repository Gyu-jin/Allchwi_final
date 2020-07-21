package com.jhta.allchwi.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	
	@GetMapping("/onclass/community")
	public String adminMain() {
		return ".community";
	}
}
