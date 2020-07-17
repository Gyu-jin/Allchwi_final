package com.jhta.allchwi.controller.search;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Controller
public class DetailSearchController {

	@RequestMapping(value = "/class/detailSearch", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String goList(String keyword, String startDate, String endDate, @RequestParam(value = "cates[]") List<String> cates) {

		ArrayList<ClassInfoVO> list = new ArrayList<ClassInfoVO>();
		
		System.out.println("keyword : "+keyword);
		
		 for(String cate:cates) { 
			 System.out.println("선택된 카테고리 번호 : " +cate);
		 }
		
		
		JSONArray arr = new JSONArray();
		for (ClassInfoVO vo : list) {
			JSONObject json = new JSONObject();
			json.put("class_num", vo.getClass_num());
			json.put("scategory_num", vo.getScategory_num());
			json.put("class_title", vo.getClass_title());
			json.put("sloc_num", vo.getSloc_num());
			json.put("tutor_nickname", vo.getTutor_nickname());
			json.put("startDate", startDate);
			json.put("endDate", endDate);			
			arr.put(json);
		}
		return arr.toString();
	}
}
