package com.jhta.allchwi.controller.classapply;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ClassApplyController {
	
	//class_num에 해당하는 수업 신청서 페이지로 이동
	@GetMapping("/class/apply")
	public String goClassapply() {
		//class_num 필요
		return ".classapply.ClassApply";
	}
	
	// 수업신청 테이블에 필요한 데이터 받아서 insert할 예정.. , ajax callback함수에 success 문자열 전송
	@PostMapping("/class/applyOk")
	@ResponseBody
	public String classApplyOk(String date_num,String stu_lev) {
		System.out.println("apply post mapping..");
		return "success";

	}
	
	// 수업신청 성공 시 페이지 이동하는 메소드
	@RequestMapping(value="/class/success", method = RequestMethod.GET)
	public String goSuccess(String date_num,Model model) {
		System.out.println("성공!");
		model.addAttribute("date_num",date_num);
		return ".classapply.success";
	}
}
