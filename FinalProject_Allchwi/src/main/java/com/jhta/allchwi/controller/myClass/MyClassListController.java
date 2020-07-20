package com.jhta.allchwi.controller.myClass;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.allchwi.service.classapply.PaymentService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.myclasslist.MyClassListVO;

@Controller
public class MyClassListController {
	@Autowired
	private ClassInfoService service;
	@Autowired
	private PaymentService payService;
	
	
	@GetMapping("/mypage/myClassList")
	public String goMyClassList(HttpSession session,Model model) {
		
		int ml_num = (int)session.getAttribute("ml_num");
		
		// 내 수업 목록 가져오기
		List<MyClassListVO> list = service.getMyList(ml_num);
		
		for(MyClassListVO vo : list) {
			System.out.println(vo.getClass_num());
			System.out.println(vo.getDate_num());
			System.out.println(vo.getApply_auth());
			System.out.println(vo.getClass_fee());
			System.out.println(vo.getClass_rating());
			System.out.println(vo.getClass_title());
			System.out.println(vo.getCover_num());
			System.out.println(vo.getScategory_name());
			System.out.println(vo.getApply_regdate());
		}
		
		model.addAttribute("list", list);
		
		return ".myClass.myClassList";
	}
	  
	@PostMapping("/mypage/finishUpdate")
	public String classFinishUpdate(HttpSession session,int apply_num) {
		
		int ml_num = (int)session.getAttribute("ml_num");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ml_num", ml_num);
		map.put("apply_num", apply_num);
		
		if(apply_num != 0) {
			//payService.finishUpdate(map);
		}else {
			return "fail";
		}
		
		return null;
	}
}
