package com.jhta.allchwi.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ChangePwdController {
	@GetMapping("/mypage/changePwd")
	public String goPage() {
		return ".mypage.changePwd";
	}
}
