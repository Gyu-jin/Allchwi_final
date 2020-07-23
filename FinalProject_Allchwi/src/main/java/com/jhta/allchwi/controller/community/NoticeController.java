package com.jhta.allchwi.controller.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {
	//a 커뮤니티 페이지로 이동
	@GetMapping("/community/notice")
	public String goNotice(Model model, @RequestParam(value="pageNum",defaultValue = "1") int pageNum) {
		return ".community.notice.main";
	}
	//a 공지글 작성 모달창 띄우기
	@RequestMapping("/community/notice/writeNotice")
	public String writeNotice() {
		return "community/notice/writeNotice";
	}
	//a 모달창에서 값을 가지고 컨트롤러로 이동
	@RequestMapping("/community/notice/insertNotice")
	public String insertNotice() {
		//insert 후 공지사항 페이지로 리다이렉트 
		return "redirect:/community/notice";
	}
}
