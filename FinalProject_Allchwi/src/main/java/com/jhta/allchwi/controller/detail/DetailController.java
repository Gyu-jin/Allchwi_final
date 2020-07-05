package com.jhta.allchwi.controller.detail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DetailController {
	@GetMapping("/class/detail")
	public String detail() {
		return ".class.detail";
	}
}