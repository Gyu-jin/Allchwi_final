package com.jhta.allchwi.controller.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Controller
public class CategorySearchController {
	@Autowired private ClassInfoService service;
	
	@RequestMapping(value="/category/search",method = RequestMethod.GET)
	public ModelAndView goCategory(int bcategory_num) {
		ModelAndView mv=new ModelAndView(".search.detailSearch");
		List<ClassInfoVO> list=service.list(bcategory_num);
		mv.addObject("list", list);
		return mv;
	}
}
