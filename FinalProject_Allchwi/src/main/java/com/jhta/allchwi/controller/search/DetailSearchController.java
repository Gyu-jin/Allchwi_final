package com.jhta.allchwi.controller.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DetailSearchController {
	
	@PostMapping("/search/detailSearch")
	public String search() {
		return ".search.search";
	}
}
