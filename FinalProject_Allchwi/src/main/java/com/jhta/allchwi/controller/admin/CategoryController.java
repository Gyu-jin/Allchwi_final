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
import com.jhta.allchwi.vo.admin.BigCategoryVO;
import com.jhta.allchwi.vo.admin.BigsmallCategoryVO;
import com.jhta.allchwi.vo.admin.SmallCategoryVO;

@Controller
public class CategoryController {
	@Autowired
	private categoryService service;
	
	@GetMapping("/admin/category")
	public String adminMain(Model model) {
		List<BigsmallCategoryVO> list = service.list();
		List<BigCategoryVO> bcate_list = service.bcate_list();
		
		model.addAttribute("list", list);
		model.addAttribute("bcate_list", bcate_list);
		return ".admin.category";
	}
	
	
	
	@RequestMapping(value="/admin/big_category/insert",produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> big_category(BigCategoryVO vo,Model model) {
		service.bcate_insert(vo);
		List<BigsmallCategoryVO> list = service.list();
		
		return list;
	}

	
	@RequestMapping(value="/admin/big_category_list",produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigCategoryVO> big_category_list(Model model) {
		List<BigCategoryVO> bcate_list = service.bcate_list();
		return bcate_list;
	}

	
	
	@RequestMapping(value="/admin/small_category",produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> small_category(SmallCategoryVO vo,Model model) {
		
		service.scate_insert(vo);	
		List<BigsmallCategoryVO> list = service.list();
		
		return list;
	}
	
	
	
	

	@RequestMapping(value = "/admin/category/deleteScate", produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> scategory_del(int scategory_num) {
		service.del_scate(scategory_num);
		List<BigsmallCategoryVO> whole_list= service.list();
			
		return whole_list;
		
	}
	
	@RequestMapping(value = "/admin/category/deleteBcate", produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> bcategory_del(int bcategory_num) {
		service.del_bcate(bcategory_num);
		List<BigsmallCategoryVO> whole_list= service.list();
		
		return whole_list;	
	}
	
}
