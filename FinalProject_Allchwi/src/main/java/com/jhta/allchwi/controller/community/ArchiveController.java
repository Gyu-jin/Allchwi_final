package com.jhta.allchwi.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ArchiveController {
	
	@GetMapping("/community/archive")
	public String goAssign() {
		return ".community.board.archive";
	}
}
