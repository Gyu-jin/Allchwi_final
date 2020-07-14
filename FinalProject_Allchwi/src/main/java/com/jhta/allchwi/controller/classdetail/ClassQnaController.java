package com.jhta.allchwi.controller.classdetail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.classdetail.ClassQnaService;
import com.jhta.allchwi.vo.classqna.ClassQnaVO;


@Controller
public class ClassQnaController {
	@PostMapping("/classDetail/qna")
	@ResponseBody
	public String insertQna(ClassQnaVO qvo) {
		try {
			ClassQnaService.insertQna(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	@PostMapping("/classDetail/qnareply")
	@ResponseBody
	public String insertRelply(ClassQnaVO qvo) {
		try {
			ClassQnaService.insertReply(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
}
