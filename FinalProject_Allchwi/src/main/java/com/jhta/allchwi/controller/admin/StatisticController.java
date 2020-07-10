package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticController {

	@GetMapping("/admin/statistic")
	public String statstic() {
		return ".admin.statistic";
	}
	
	
	
}
