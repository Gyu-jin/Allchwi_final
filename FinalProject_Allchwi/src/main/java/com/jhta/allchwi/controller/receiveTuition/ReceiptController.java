package com.jhta.allchwi.controller.receiveTuition;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jhta.allchwi.service.receiveTuition.ReceiptService;
import com.jhta.allchwi.vo.receiveTuition.ReceiptVO;

@Controller
public class ReceiptController {
	@Autowired
	private ReceiptService service;
	
	
	@GetMapping("/receipt/main")
	public String adminMain(Model model) {
		
		List<ReceiptVO> list = service.receipt_list();
		model.addAttribute("list", list);
		
		return ".receipt.receiveTuition";
	}
	
}
