package com.jhta.allchwi.controller.classdetail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ClassDetailController {
	@GetMapping("/classDetail/detail")
	public ModelAndView detail() {
		ModelAndView mv=new ModelAndView(".classDetail.detail");
		String id="test";
		mv.addObject("id", id);
		return mv;
	}
}
