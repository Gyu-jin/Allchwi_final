package com.jhta.allchwi.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginMainController {	

	@GetMapping("/login/main")
	public String adminMain() {
		return ".login.main";
	}
}
