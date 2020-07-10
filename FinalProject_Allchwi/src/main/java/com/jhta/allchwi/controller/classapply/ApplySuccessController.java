package com.jhta.allchwi.controller.classapply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ApplySuccessController {
	
	@GetMapping("/class/success")
	@ResponseBody
	public String goSuccess() {
		System.out.println("성공!");
		return ".classapply.success";
	}
}
