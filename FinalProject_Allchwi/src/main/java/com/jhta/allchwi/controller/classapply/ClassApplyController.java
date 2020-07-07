package com.jhta.allchwi.controller.classapply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassApplyController {
	
	@GetMapping("/class/apply")
	public String goClassapply() {
		return ".classapply.ClassApply";
	}
}
