package com.jhta.allchwi.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.allchwi.service.login.MemberLoginService;

@Controller
public class LoginMainController {	
	@Autowired
	private MemberLoginService mls;
	//1 로그인창으로 이동
	@GetMapping("/login/main")
	public String adminMain() {
		return ".login.main";
	}
	//2 로그인정보 확인 
	@PostMapping("/login/signUp")
	public String loginCheck() {
		return "aa";
	}
}
