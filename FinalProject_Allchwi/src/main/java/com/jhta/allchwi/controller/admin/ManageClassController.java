package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.admin.manageClassService;
import com.jhta.allchwi.vo.admin.manage_classVo;

@Controller
public class ManageClassController {
	@Autowired
	private manageClassService service;
	
	@GetMapping("/admin/manageClass")
	public String manageClass(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,Model model) {
	
		 
		 int totalRowCount =service.count();
		 PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		 
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("startRow", pu.getStartRow());
		 map.put("endRow",pu.getEndRow());
		 
		 List<manage_classVo> list =service.manage_list(map);
		 
		 model.addAttribute("list", list);
		 model.addAttribute("pu",pu);
		 
		 
		return ".admin.manageClass";
	}
	
	
	
	
}
