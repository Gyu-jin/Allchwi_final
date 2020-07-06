package com.jhta.allchwi.controller.classopen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassOpenController {
	
	@GetMapping("/class/enrollment")
	public String goEnrollement() {
		return ".classOpen.ClassEnrollment";
	}
}
