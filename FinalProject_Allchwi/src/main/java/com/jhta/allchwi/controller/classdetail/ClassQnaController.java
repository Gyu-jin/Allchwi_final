package com.jhta.allchwi.controller.classdetail;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("/classDetail/qnalist")
	@ResponseBody
	public List<ClassQnaVO> qnaList(ClassQnaVO qvo) {
		List<ClassQnaVO> qlist=service.qnaList(qvo.getClass_num());
		return qlist;
	}
	@GetMapping("/classDetail/commlist")
	@ResponseBody
	public List<ClassQnaVO> commList(@RequestParam HashMap<String, Object> map){;
		List<ClassQnaVO> commlist=service.commList(map);
		return commlist;
	}
}
