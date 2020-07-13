package com.jhta.allchwi.controller.search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Controller
public class KeywordSearchController {
	@Autowired private ClassInfoService service;
	
	@GetMapping("/keyword/search")
	public ModelAndView search(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String keyword) {
		ModelAndView mv=new ModelAndView(".search.detailSearch");
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		
		List<ClassInfoVO> list=service.keyword_list(keyword);
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 6, 5);
		int startRow=pu.getStartRow()-1;
		map.put("startRow", startRow);
		mv.addObject("keyword",keyword);
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		return mv;
	}
}
