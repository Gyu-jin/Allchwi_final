package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.admin.confirmClassService;
import com.jhta.allchwi.vo.admin.ConfirmClassVO;

@Controller
public class ConfirmClassController {
	@Autowired
	private confirmClassService service;
	
	@GetMapping("/admin/confirmClass")
	public String classlist(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,String field, String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);

		int totalRowCount = service.count(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		
		map.put("startRow", pu.getStartRow()-1);
		map.put("endRow", pu.getEndRow());
		
		List<ConfirmClassVO> list = service.confirm_list(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		model.addAttribute("keyword",keyword);
		model.addAttribute("field", field);
		
		
		return ".admin.confirmClass";
	}
	
	@GetMapping("/admin/acceptClass")
	public String acceptClass(@RequestParam("class_num") int class_num) {
		System.out.println(class_num);
		service.acceptClass(class_num);
		
		return ".admin.confirmClass";
	
	}
	
}
