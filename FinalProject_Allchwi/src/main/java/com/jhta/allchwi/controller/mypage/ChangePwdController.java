package com.jhta.allchwi.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ChangePwdController {
	//비밀번호 변경 페이지로 이동
	@GetMapping("/mypage/changePwd")
	public String goPage() {
		return ".mypage.changePwd";
	}
	//비밀번호 변경 처리후 메인페이지로 리다이렉트 
	
}
