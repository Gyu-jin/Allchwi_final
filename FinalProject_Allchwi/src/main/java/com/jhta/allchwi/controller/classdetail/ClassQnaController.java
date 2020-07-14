package com.jhta.allchwi.controller.classdetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.classdetail.ClassQnaService;
import com.jhta.allchwi.vo.classqna.ClassQnaVO;


@Controller
public class ClassQnaController {
	@Autowired
	private ClassQnaService service;
	
	@PostMapping("/classDetail/qna")
	@ResponseBody
	public String insertQna(ClassQnaVO qvo) {
		try {
			service.insertQna(qvo);
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
			service.insertReply(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
}
