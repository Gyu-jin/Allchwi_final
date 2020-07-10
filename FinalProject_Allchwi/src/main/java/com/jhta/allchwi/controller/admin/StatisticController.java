package com.jhta.allchwi.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticController {

	@GetMapping("/admin/statistic1")
	public String statstic() {
		return ".admin.statistic1";
	}
	
	@GetMapping("/admin/statistic2")
	public String statstic2() {
		return ".admin.statistic2";
	}
	
	@GetMapping("/admin/statistic3")
	public String statstic3() {
		return ".admin.statistic3";
	}
	
	
	
}
