package com.jhta.allchwi.controller.community;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.community.AssignDataService;
import com.jhta.allchwi.service.community.AssignSubmitService;
import com.jhta.allchwi.service.community.AssignmentService;
import com.jhta.allchwi.vo.community.AssignSubmitVO;
import com.jhta.allchwi.vo.community.AssignmentVO;

@Controller
public class AssignmentController {
	@Autowired private AssignmentService assign_service;
	@Autowired private AssignSubmitService submit_service;
	@Autowired private AssignDataService data_service;
	
	
	// 과제 게시판으로 이동
	@GetMapping("/community/assignment")
	public String goAssign(Model model) {
		
		List<AssignmentVO> list=assign_service.list();
		model.addAttribute("list", list);
		return ".community.board.assignment";
	}
	
	// 튜터 과제 업로드
	@RequestMapping(value="/assign/upload", method = RequestMethod.POST)
	@ResponseBody
	public String uploadOk(AssignmentVO vo) {
		
		int n=assign_service.insert(vo);
		if(n>0) {		
			return "success";
		}else {
			return "fail";
		}

	}
	
	// 튜터 과제 삭제
	@RequestMapping(value="/assign/delete", method = RequestMethod.GET)
	@ResponseBody
	public String deleteOk(int assign_num) {
	
		int n=assign_service.delete(assign_num);
		if(n>0) {		
			return "success";
		}else {
			return "fail";
		}
		
	}
	// 튜터 과제 수정할 목록 불러오기
	@RequestMapping(value="/assign/update", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String update(int assign_num) {
		
		AssignmentVO vo=assign_service.updatelist(assign_num);
		JSONObject json=new JSONObject();
		json.put("assign_title", vo.getAssign_title());
		json.put("assign_content", vo.getAssign_content());
		json.put("assign_num", vo.getAssign_num());
		return json.toString();
		
	}
	
	// 튜터 과제 수정
	@RequestMapping(value="/assign/updateOk", method = RequestMethod.POST)
	@ResponseBody
	public String updateOk(AssignmentVO vo) {
		System.out.println("assign/updateOk method");
		int n=assign_service.update(vo);
		if(n>0) {		
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 학생 과제 제출 Submit
	@PostMapping("/assign/submit")
	public String submitOk(AssignSubmitVO vo) {
		
		return "";
		
	}
}
