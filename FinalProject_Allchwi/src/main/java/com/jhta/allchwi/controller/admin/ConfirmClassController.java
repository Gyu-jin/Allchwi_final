package com.jhta.allchwi.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.admin.confirmClassService;
import com.jhta.allchwi.vo.admin.ConfirmClassVO;

@Controller
public class ConfirmClassController {
	@Autowired
	private confirmClassService service;
	
	@GetMapping("/admin/confirmClass")
	public String classlist(Model model) {
		List<ConfirmClassVO> list = service.confirm_list();
		model.addAttribute("list", list);
		
		return ".admin.confirmClass";
	}
	
	
}
