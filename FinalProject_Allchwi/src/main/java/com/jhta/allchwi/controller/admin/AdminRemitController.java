package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.admin.AdminRemitService;
import com.jhta.allchwi.vo.admin.AdminRemitVO;
import com.jhta.allchwi.vo.receiveTuition.InsertRemitVO;

@Controller
public class AdminRemitController {
	@Autowired
	private AdminRemitService service;
	
	@RequestMapping(value= {"/admin/remit","/admin/receiptAccept"})
	public String goPayment(HttpServletRequest request, Model model,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value="pay_num", defaultValue = "1") int pay_num) {
		
		if(request.getServletPath().equals("/admin/receiptAccept")) {
			service.accept(pay_num);	// 송금신청 승인			
		}
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int totalRowCount = service.count();
		PageUtil pu= new PageUtil(pageNum, totalRowCount, 5, 5);
		
		map.put("startRow", pu.getStartRow()-1);	
		List<AdminRemitVO> list = service.remit_list(map);
	
		
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		
		return ".admin.remit";
	}
	
}

