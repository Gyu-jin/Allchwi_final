package com.jhta.allchwi.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.allchwi.vo.community.AssignSubmitVO;

@Controller
public class AssignmentController {
	
	@GetMapping("/community/assignment")
	public String goAssign() {
		return ".community.board.assignment";
	}
	
	@PostMapping("/assign/submit")
	public String submitOk(AssignSubmitVO vo) {
		return "";
		
	}
}
