package com.jhta.allchwi.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PointController {
	@GetMapping("/mypage/pointForm")
	public String goPoint() {
		return ".mypage.point";
	}
}
