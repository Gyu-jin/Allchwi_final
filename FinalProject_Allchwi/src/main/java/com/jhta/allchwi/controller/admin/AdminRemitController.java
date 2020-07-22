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
import com.jhta.allchwi.vo.admin.SalesVO;
import com.jhta.allchwi.vo.receiveTuition.InsertRemitVO;

@Controller
public class AdminRemitController {
	@Autowired
	private AdminRemitService service;
	
	@RequestMapping(value= {"/admin/remit","/admin/receiptAccept"})
	public String goPayment(HttpServletRequest request, Model model,String field, String keyword,
			@RequestParam(value="pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value="pay_num", defaultValue = "1") int pay_num,
			@RequestParam(value="rem_pay", defaultValue = "1") int rem_pay,String tutor_nickname,String class_title
			){
		
		if(request.getServletPath().equals("/admin/receiptAccept")) {
			SalesVO vo = new SalesVO(pay_num, class_title, tutor_nickname, rem_pay);
			try {
				service.acceptAndSales(pay_num, vo); //rem_stauts=1과 sales테이블에 insert				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword",keyword);
		
		int totalRowCount = service.count(map);
		PageUtil pu= new PageUtil(pageNum, totalRowCount, 5, 5);
		
		map.put("startRow", pu.getStartRow()-1);	
		List<AdminRemitVO> list = service.remit_list(map);
	
		
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		model.addAttribute("keyword",keyword);
		model.addAttribute("field", field);
		
		
		return ".admin.remit";
	}
	
}

