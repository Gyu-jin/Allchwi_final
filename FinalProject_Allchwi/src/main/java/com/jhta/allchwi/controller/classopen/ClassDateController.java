package com.jhta.allchwi.controller.classopen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassDateController {
	
	@GetMapping("/class/classDate")
	public String goClassDate() {
		
		return ".classOpen.classDate";
	}
	
	@GetMapping("/class/dateModal")
	public String goClassModal() {
		
		return "classOpen/dateModal";
	}
	
}
