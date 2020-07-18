package com.jhta.allchwi.controller.classopen;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.classopen.ClassImgVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Controller
public class ClassMyBoardController {
	@Autowired
	private ClassInfoService service;
	
	@GetMapping("/class/classBoard")
	public String goClassMyboard(HttpSession session,Model model,
								@RequestParam(value = "class_num",defaultValue = "0")int class_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 로그인 번호 
		int ml_num = (int)session.getAttribute("ml_num");
		map.put("ml_num", ml_num);
		if(class_num !=0) {
			map.put("class_num",class_num);
		}
		
		
		// 내수업 첫화면 정보 가져오기
		HashMap<String, Object> list = service.getMyBoardInfo(map);
		System.out.println(list.get("cover_num"));
		//내수업 전체 목록 제목,번호가져오기
		List<ClassInfoVO> title = service.getClassTitle(ml_num);
		
		
		model.addAttribute("list", list);
		model.addAttribute("title", title);
		
		
		return ".classOpen.classMyBoard";
	}
}
