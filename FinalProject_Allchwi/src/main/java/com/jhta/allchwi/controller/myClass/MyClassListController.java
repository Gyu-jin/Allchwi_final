package com.jhta.allchwi.controller.myClass;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyClassListController {
	
	@GetMapping("/mypage/myClassList")
	public String goMyClassList(HttpSession session) {
		return ".myClass.myClassList";
	}
}
