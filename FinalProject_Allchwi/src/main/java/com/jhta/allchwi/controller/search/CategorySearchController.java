package com.jhta.allchwi.controller.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CategorySearchController {
	
	@RequestMapping(value="/search/bigcategory",method = RequestMethod.GET)
	public String goCategory(int bigcategory_num) {
		
		return ".search.detailSearch";
	}
}
