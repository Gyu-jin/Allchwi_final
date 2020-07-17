package com.jhta.allchwi.controller.classopen;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassMyBoardController {
	
	@GetMapping("/class/classBoard")
	public String goClassMyboard(HttpSession session) {
		int ml_num = (int)session.getAttribute("ml_num");
		
		
		
		
		return ".classOpen.classMyBoard";
	}
}
