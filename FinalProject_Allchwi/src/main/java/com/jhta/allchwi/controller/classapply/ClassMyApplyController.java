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
	public String goClassMyboard(Model model,int apply_num, int class_num) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("apply_num",apply_num);
		map.put("class_num",class_num);
		List<ClassApplyDateInfoVO> list = service.list(map);
				
		model.addAttribute("list", list);	
				
		return ".classapply.MyApply";
	}
}
