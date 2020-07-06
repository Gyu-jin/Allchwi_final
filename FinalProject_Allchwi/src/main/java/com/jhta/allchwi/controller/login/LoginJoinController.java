package com.jhta.allchwi.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginJoinController {
	@GetMapping("/login/join")
	public String adminMain() {
		return ".login.join";
	}
}
