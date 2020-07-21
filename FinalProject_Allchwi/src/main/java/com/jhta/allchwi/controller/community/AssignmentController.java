package com.jhta.allchwi.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AssignmentController {
	
	@GetMapping("/community/assignment")
	public String goAssign() {
		return ".community.board.assignment";
	}
}
