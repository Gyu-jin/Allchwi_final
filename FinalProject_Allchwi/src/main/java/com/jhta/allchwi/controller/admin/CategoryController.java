package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.admin.categoryService;
import com.jhta.allchwi.vo.admin.BigCategoryVO;
import com.jhta.allchwi.vo.admin.BigsmallCategoryVO;
import com.jhta.allchwi.vo.admin.SmallCategoryVO;

@Controller
public class CategoryController {
	@Autowired
	private categoryService service;
	
	@GetMapping("/admin/category")
	public String adminMain(Model model,@RequestParam(value="pageNum", defaultValue ="1"  )int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int totalRowCount =service.count();
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		map.put("startRow", pu.getStartRow());
		
		List<BigsmallCategoryVO> list = service.cate_list(map);
		List<BigCategoryVO> bcate_list = service.bcate_list();
		
		model.addAttribute("list", list);
		model.addAttribute("bcate_list", bcate_list);
		return ".admin.category";
	}
	
	
	

	@RequestMapping(value="/admin/searchByCate/list",produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> searchByCate() {
		
		List<BigsmallCategoryVO> list = service.list();
		
		return list;
	}
	
		
	@RequestMapping(value="/admin/big_category/insert",produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> big_category(BigCategoryVO vo) {
		service.bcate_insert(vo);
		List<BigsmallCategoryVO> list = service.list();
		
		return list;
	}

	
	@RequestMapping(value="/admin/big_category_list",produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigCategoryVO> big_category_list() {
		List<BigCategoryVO> bcate_list = service.bcate_list();
		return bcate_list;
	}

	
	
	@RequestMapping(value="/admin/small_category",produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> small_category(SmallCategoryVO vo) {
		
		service.scate_insert(vo);	
		List<BigsmallCategoryVO> list = service.list();
		
		return list;
	}
	
	@RequestMapping(value = "/admin/category/deleteScate", produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> scategory_del(int scategory_num, int bcategory_num) {
		service.del_scate(scategory_num);
		
		//List<BigsmallCategoryVO> whole_list = service.list();	//다지우고 전체 띄우기
		
		List<BigsmallCategoryVO> searchByCate_list = service.searchByCate(bcategory_num);
		return searchByCate_list;	
	}
	
	@RequestMapping(value = "/admin/category/deleteScate2", produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> scategory_del2(int scategory_num, int bcategory_num) {
		service.del_scate(scategory_num);
		
		List<BigsmallCategoryVO> whole_list = service.list();	//다지우고 전체 띄우기
		
		
		return whole_list;	
	}
	
	
	
	
	@RequestMapping(value = "/admin/category/deleteBcate", produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> bcategory_del(int bcategory_num) {
		service.del_bcate(bcategory_num);
		List<BigsmallCategoryVO> whole_list= service.list();
		
		return whole_list;	
	}
	
	
	
	@RequestMapping(value = "/admin/category/searchByCate", produces= "application/json;charset=utf-8")
	@ResponseBody
	public List<BigsmallCategoryVO> searchByCate(int bcategory_num) {
		List<BigsmallCategoryVO> searchByCate_list = service.searchByCate(bcategory_num);
		return searchByCate_list;	
	}
	
	
}
