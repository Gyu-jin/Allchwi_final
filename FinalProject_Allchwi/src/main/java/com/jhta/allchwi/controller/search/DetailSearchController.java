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
	public String goList(String keyword, String startDate, String endDate, @RequestParam(value = "cccc[]") List<String> cccc) {

		ArrayList<ClassInfoVO> list = new ArrayList<ClassInfoVO>();
		list.add(new ClassInfoVO(1, 1, 1, 1, 1, "다은", "01047990968", "강남", 1, 1, 1, "다은이의 쉐킷마카롱", 76000, 1, 1, 1,
				"튜터소개", "수업소개", "수업대상", null));
		list.add(new ClassInfoVO(2, 1, 3, 4, 5, "민지", "01012344567", "강북", 1, 5, 2, "민지의 향수만들기 클래스", 76000, 1, 1, 1,
				"튜터소개입니다", "수업소개입니다", "강아지대상", null));
		list.add(new ClassInfoVO(3, 1, 3, 4, 5, "지민", "01012344567", "강북", 1, 5, 2, "지민이의 방송댄스", 76000, 1, 1, 1,
				"튜터소개입니다", "수업소개입니다", "강아지대상", null));
		
		System.out.println("keyword : "+keyword);
		
		 for(String cate:cccc) {
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
