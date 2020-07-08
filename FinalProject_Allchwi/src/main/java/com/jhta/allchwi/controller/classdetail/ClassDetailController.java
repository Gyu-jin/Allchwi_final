package com.jhta.allchwi.controller.classdetail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClassDetailController {
	@GetMapping("/classDetail/detail")
	public String detail() {
		return ".classDetail.detail";
	}
}