package com.jhta.allchwi.controller.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.allchwi.vo.login.MemberLoginVO;

@Controller
public class MailSenderController {
	/*
	@Autowired
	private JavaMailSender mailSender;
	*/
	@RequestMapping("/login/searchPwd")
	public String searchPwdEmail(MemberLoginVO mlv, String sendEmail, Model model, HttpServletRequest req) {
		//jsp에서 넘어온 값 받기
		String id = mlv.getId();
		System.out.println(id + "   " + sendEmail);
		// 
		return "redirect:/";
	}
}
