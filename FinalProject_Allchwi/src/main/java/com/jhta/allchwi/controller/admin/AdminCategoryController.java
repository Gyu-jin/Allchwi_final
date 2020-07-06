package com.jhta.allchwi.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.admin.categoryService;
import com.jhta.allchwi.vo.admin.big_categoryVo;
import com.jhta.allchwi.vo.admin.small_categoryVo;

@Controller
public class AdminCategoryController {
	@Autowired
	private categoryService service;
	
	
	@GetMapping("/admin/category")
	public String adminMain(Model model) {
		List<big_categoryVo> list = service.list();
		
		model.addAttribute("list", list);
		return ".admin.category";
	}
	
	@GetMapping("/admin/big_category")
	public String big_category(big_categoryVo vo) {
		service.bcate_insert(vo);
		return ".admin.category";
	}

	@GetMapping("/admin/small_category")
	public String small_category(small_categoryVo vo) {
		service.scate_insert(vo);
		return ".admin.category";
	}
	


}
