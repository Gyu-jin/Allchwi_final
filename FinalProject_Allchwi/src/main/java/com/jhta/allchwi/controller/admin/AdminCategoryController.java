package com.jhta.allchwi.controller.admin;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jhta.allchwi.service.admin.categoryService;
import com.jhta.allchwi.vo.admin.big_categoryVo;
import com.jhta.allchwi.vo.admin.bigsmall_categoryVo;
import com.jhta.allchwi.vo.admin.small_categoryVo;

@Controller
public class AdminCategoryController {
	@Autowired
	private categoryService service;
	
	
	@GetMapping("/admin/category")
	public String adminMain(Model model) {
		List<bigsmall_categoryVo> list = service.list();
		
		model.addAttribute("list", list);
		return ".admin.category";
	}
	
	
	
	@RequestMapping(value="/admin/big_category",produces= "application/json;charset=utf-8")
	@ResponseBody
	public String big_category(big_categoryVo vo,Model model) {
		service.bcate_insert(vo);
		
		List<bigsmall_categoryVo> list = service.list();
		JSONArray arr = new JSONArray();
		for(bigsmall_categoryVo vo2 :list){
			JSONObject json = new JSONObject();
			json.put("bcategory_num", vo2.getBcategory_num());
			json.put("bcategory_name", vo2.getBcategory_name());
			json.put("scategory_name", vo2.getScategory_name());
			arr.put(json);
		}
		return arr.toString();
	}

	
	
	
	//@GetMapping("/admin/small_category")
	@RequestMapping(value="/admin/small_category",produces= "application/json;charset=utf-8")
	@ResponseBody
	public String small_category(small_categoryVo vo,Model model) {
		
		service.scate_insert(vo);
				
		List<bigsmall_categoryVo> list = service.list();
		JSONArray arr= new JSONArray();		
		for(bigsmall_categoryVo vo2 : list) {
			JSONObject json = new JSONObject();		
			json.put("bcategory_num", vo2.getBcategory_num());
			json.put("bcategory_name", vo2.getBcategory_name());
			json.put("scategory_name", vo2.getScategory_name());
			arr.put(json);
		}	
		return arr.toString();
	}
	


}
