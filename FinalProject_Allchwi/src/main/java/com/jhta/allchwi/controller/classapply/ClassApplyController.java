package com.jhta.allchwi.controller.classapply;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ClassApplyController {
	
	@GetMapping("/class/apply")
	public String goClassapply() {
		//class_num 필요
		return ".classapply.ClassApply";
	}
	
	@PostMapping("/class/applyOk")
	@ResponseBody
	public String classApplyOk(String date_num,String stu_lev) {
		System.out.println("apply post mapping..");
		
		return "success";

	}

}
