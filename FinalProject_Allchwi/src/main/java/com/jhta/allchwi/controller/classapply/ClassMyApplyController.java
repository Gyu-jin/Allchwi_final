package com.jhta.allchwi.controller.classapply;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.jhta.allchwi.service.classapply.ClassApplyService;
import com.jhta.allchwi.vo.classapply.ClassApplyDateInfoVO;


@Controller
public class ClassMyApplyController {
	
	@Autowired private ClassApplyService service;
	
	@GetMapping("/class/myapply")
	public String goClassMyboard(Model model,int ml_num) {

		//내수업신청서 전체 목록 제목,번호가져오기
		List<ClassApplyDateInfoVO> list = service.list(ml_num);
				
		model.addAttribute("list", list);	
				
		return ".classapply.MyApply";
	}
}
