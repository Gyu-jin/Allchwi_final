package com.jhta.allchwi.controller.search;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ClassSearchListController {
	
	@RequestMapping("/class/searchList")
	@ResponseBody
	public List<String> goList(String startDate) {
		
		ArrayList<String> list=new ArrayList<String>();
		list.add("class111");
		list.add(startDate);
		return list;
	}
}
