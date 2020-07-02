package com.jhta.allchwi.controller.search;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DetailSearchController {
	
	@PostMapping("/search/detailSearch")
	public String search(String keyword, Model model) {
		model.addAttribute("keyword",keyword);
		return ".search.search";
	}
}
