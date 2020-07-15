package com.jhta.allchwi.controller.mypage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.point.PointService;
import com.jhta.allchwi.vo.point.PointListVO;

@Controller
public class PointController {
	@Autowired
	private PointService ps;
	
	@GetMapping("/mypage/pointForm")
	public String goPoint(HttpSession session, Model model, HashMap<String, Object> hm) {
		//리스트에 서비스에서 넣어준 값 담기
		List<PointListVO> list = ps.pointList(session, hm);
		//총 포인트 계산 
		int total = ps.getTotal(session, hm);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return ".mypage.mypoint";
	}
}
