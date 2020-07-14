package com.jhta.allchwi.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.login.MemberLoginService;

@Controller
public class LogoutController {
	@Autowired
	private MemberLoginService mls;
	@GetMapping("/login/logout")
	public String logout(HttpSession session) {
		mls.logout(session);
		return "redirect:/";
	}
}
