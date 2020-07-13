package com.jhta.allchwi.controller.classdetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;


@Controller
public class ClassDetailController {
	@Autowired
	private ClassInfoService classinfo_service;
	
	@GetMapping("/classDetail/detail")
	public ModelAndView detail(int class_num) {
		ModelAndView mv=new ModelAndView(".classDetail.detail");
		ClassInfoVO cvo=classinfo_service.getInfo(class_num);
		String id="test";
		mv.addObject("id", id);
		mv.addObject("cvo", cvo);
		mv.addObject("class_num", class_num);
		return mv;
	}
}
