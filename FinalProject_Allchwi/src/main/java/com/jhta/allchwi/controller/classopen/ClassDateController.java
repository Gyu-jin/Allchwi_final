package com.jhta.allchwi.controller.classopen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@PostMapping("/class/classModal")
	@ResponseBody
	public String ClassDateInsert() {
		
		return "success";
	}
	
}
