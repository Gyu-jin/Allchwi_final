package com.jhta.allchwi.controller.classopen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassMyBoardController {
	
	@GetMapping("/class/classBoard")
	public String goClassMyboard() {
		return ".classOpen.classMyBoard";
	}
}
