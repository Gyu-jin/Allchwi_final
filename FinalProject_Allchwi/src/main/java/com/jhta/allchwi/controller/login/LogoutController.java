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
		//a 카카오 회원일 경우
		String access_Token = (String)session.getAttribute("access_Token");
		if(access_Token != null || access_Token != "") {
			session.removeAttribute("access_Token");
		}
		mls.logout(session);
		return "redirect:/";
	}
}
