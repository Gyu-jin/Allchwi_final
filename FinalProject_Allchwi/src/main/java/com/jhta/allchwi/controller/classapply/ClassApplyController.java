package com.jhta.allchwi.controller.classapply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ClassApplyController {
	
	@GetMapping("/class/apply")
	public String goClassapply() {
		//class_num 필요
		return ".classapply.ClassApply";
	}
	
	@PostMapping("/class/applyOk")
	public String classApplyOk() {
		
		return "";
	}
}
