package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.admin.AdminPaymentService;
import com.jhta.allchwi.vo.admin.AdminPaymentVO;

@Controller
public class AdminPaymentController {
	@Autowired
	private AdminPaymentService service;
	
	@GetMapping("/admin/payment")
	public String goPayment(Model model,String field,String keyword,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword", keyword);
		
		//System.out.println(field);
		//System.out.println(keyword);
		
		int totalRowCount = service.count(map);
		PageUtil pu= new PageUtil(pageNum, totalRowCount, 5, 5);
		
		map.put("startRow", pu.getStartRow()-1);
		map.put("endRow", pu.getEndRow());
		
		//System.out.println(pu.getStartRow()-1);
		//System.out.println(pu.getEndRow());
		
		List<AdminPaymentVO> list = service.payment_list(map);
		model.addAttribute("list",list);
		model.addAttribute("pu",pu);
		model.addAttribute("keyword",keyword);
		model.addAttribute("field", field);
		
		return ".admin.payment";
	}
	
	
	
}
