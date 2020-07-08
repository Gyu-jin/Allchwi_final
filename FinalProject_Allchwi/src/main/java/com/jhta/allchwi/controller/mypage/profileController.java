package com.jhta.allchwi.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class profileController {
	@GetMapping("/mypage/mypageForm")
	public String goJoin() {
		return ".mypage.profile";
	}

}
