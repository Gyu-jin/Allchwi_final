package com.jhta.allchwi.controller.search;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Controller
public class KeywordSearchController {
	
	@GetMapping("/search/keywordSearch")
	public ModelAndView search(String keyword) {
		ModelAndView mv=new ModelAndView(".search.detailSearch");
		mv.addObject("keyword",keyword);
		
		ArrayList<ClassInfoVO> list=new ArrayList<ClassInfoVO>();
		list.add(new ClassInfoVO(1, 1, 1, 1, 1, "모찌", "01047990968", "강남", 
				1, 1, 1, keyword+"의 실전산책", 76000, 1, 1, 1, "튜터소개", "수업소개", "수업대상", null));
		list.add(new ClassInfoVO(2, 1, 3, 4, 5, "민지", "01012344567", "강북", 
				1, 5, 2, keyword+"와 밍지의 요리수업", 76000, 1, 1, 1, "튜터소개입니다", "수업소개입니다","강아지대상", null));
		
		mv.addObject("keyword",keyword);
		mv.addObject("list",list);
		
		return mv;
	}
}
