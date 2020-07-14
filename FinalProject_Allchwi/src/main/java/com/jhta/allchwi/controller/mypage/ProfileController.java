package com.jhta.allchwi.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.login.MemberInfoService;
import com.jhta.allchwi.vo.login.ProfileVO;

@Controller
public class ProfileController {
	@Autowired
	private MemberInfoService mis;
	//1 회원프로필 페이지로 이동
	@GetMapping("/mypage/mypageForm")
	public String goMypage(HttpSession session, Model model) {
		//a 세션에 저장되어있는 회원번호 가져오기
		int ml_num = (int)session.getAttribute("ml_num");
		//a 서비스 메소드 가져와 vo 값 받기
		ProfileVO pfv = mis.selectInfo(ml_num);
		//a 모델 객체에 값 담아주기
		model.addAttribute("result", pfv);
		return ".mypage.profile";
	}
}
