package com.jhta.allchwi.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {
	@GetMapping("/community/notice")
	public String goNotice(Model model, @RequestParam(value="pageNum",defaultValue = "1") int pageNum) {
		return ".community.notice.main";
	}
}
