package com.jhta.allchwi.controller.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategorySearchController {
	
	@GetMapping("/search/bigcategory")
	public String goCategory(int bigcategory_num) {
		
		return ".search.detailSearch";
	}
}
