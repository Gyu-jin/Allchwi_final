package com.jhta.allchwi.controller.admin;

import java.util.List;import java.util.function.BiConsumer;

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
		
		List<big_categoryVo> bcate_list = service.bcate_list();
		
		model.addAttribute("list", list);
		model.addAttribute("bcate_list", bcate_list);
		return ".admin.category";
	}
	
	
	
	@RequestMapping(value="/admin/big_category/insert",produces= "application/json;charset=utf-8")
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

	
	@RequestMapping(value="/admin/big_category_list",produces= "application/json;charset=utf-8")
	@ResponseBody
	public String big_category_list(Model model) {
		List<big_categoryVo> bcate_list = service.bcate_list();
		
		JSONArray arr= new JSONArray();
		for(big_categoryVo vo : bcate_list) {
			JSONObject json = new JSONObject();
			json.put("bcategory_num", vo.getBcategory_num());
			json.put("bcategory_name", vo.getBcategory_name());
			arr.put(json);
		}
		return arr.toString();
	}
	
	
	
	
	
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
	
	
	
	

	@RequestMapping(value = "/admin/category/deleteScate", produces= "application/json;charset=utf-8")
	@ResponseBody
	public String scategory_del(int scategory_num) {
		int n = service.del_cate(scategory_num);
		
		if(n>0) {
			List<bigsmall_categoryVo> whole_list= service.list();
			
			JSONArray arr = new JSONArray();
			for(bigsmall_categoryVo vo2 :whole_list){
				JSONObject json = new JSONObject();
				json.put("bcategory_num", vo2.getBcategory_num());
				json.put("bcategory_name", vo2.getBcategory_name());
				json.put("scategory_name", vo2.getScategory_name());
				arr.put(json);
			}
			return arr.toString();
		}else {
			System.out.println("삭제 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/admin/category/deleteBcate", produces= "application/json;charset=utf-8")
	@ResponseBody
	public String bcategory_del(int bcategory_num) {
		service.del_bcate(bcategory_num);
		
		List<bigsmall_categoryVo> whole_list= service.list();
		
		JSONArray arr = new JSONArray();
		for(bigsmall_categoryVo vo2 :whole_list){
			JSONObject json = new JSONObject();
			json.put("bcategory_num", vo2.getBcategory_num());
			json.put("bcategory_name", vo2.getBcategory_name());
			json.put("scategory_name", vo2.getScategory_name());
			arr.put(json);
		}
		return arr.toString();	
	}
	



}
