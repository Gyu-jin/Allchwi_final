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
import com.jhta.allchwi.service.admin.confirmClassService;
import com.jhta.allchwi.service.login.MailSenderService;
import com.jhta.allchwi.vo.admin.ConfirmClassVO;

@Controller
public class ConfirmClassController {
	@Autowired
	private confirmClassService service;
	private MailSenderService mailService;
	
	@RequestMapping(value= {"/admin/confirmClass","/admin/acceptClass","/admin/denyClass"})
	public String classlist(HttpServletRequest request, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model,String field, String keyword,
			@RequestParam(value = "class_num",defaultValue = "0") int class_num, @RequestParam(value = "msg",defaultValue = "0")String msg) {
		// 수업승인 
		if(request.getServletPath().equals("/admin/acceptClass")) {
			service.acceptClass(class_num);
		}
		// 반려
		if(request.getServletPath().equals("/admin/denyClass")) {
			//수업 반려상태로 update
			//service.denyClass(class_num);
			System.out.println(msg);
			
			//반려사유 메일보내기
		
		
		
		}
		
		
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
	
}
