package com.jhta.allchwi.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.admin.big_categoryService;
import com.jhta.allchwi.vo.admin.big_categoryVo;

@Controller
public class AdminCategoryController {
	@Autowired
	private big_categoryService service;
	
	
	@GetMapping("/admin/category")
	public String adminMain() {
		return ".admin.category";
	}
	
	@GetMapping("/admin/big_category")
	public String big_category(big_categoryVo vo) {		
		service.insert(vo);
		return ".admin.category";
	}
}
