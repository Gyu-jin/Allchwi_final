package com.jhta.allchwi.controller.admin;

import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	@Autowired
	private MailSenderService mailSender;
	
	@RequestMapping(value= {"/admin/confirmClass","/admin/acceptClass","/admin/denyClass"})
	public String classlist(HttpServletRequest request, Model model,String field, String keyword,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "class_num",defaultValue = "0") int class_num,
			@RequestParam(value="id",defaultValue = "아이디없음") String id,
			@RequestParam(value = "msg",defaultValue = "0")String msg) {
		
		// 수업승인 
		if(request.getServletPath().equals("/admin/acceptClass")) {
			service.acceptClass(class_num);
		}
		// 반려
		if(request.getServletPath().equals("/admin/denyClass")) {
			//수업 반려상태로 update
			try {
			int n =service.denyClass(class_num);
				if(n>0) {
				//반려사유 메일보내기
				mailSender.sendMsg(msg,id);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}	
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
