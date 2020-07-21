package com.jhta.allchwi.controller.receiveTuition;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.receiveTuition.ReceiptService;
import com.jhta.allchwi.vo.receiveTuition.InsertRemitVO;
import com.jhta.allchwi.vo.receiveTuition.ReceiptVO;

@Controller
public class ReceiptController {
	@Autowired
	private ReceiptService service;
	
	@GetMapping("/receipt/main")
	public String adminMain(Model model,@RequestParam(value="pageNum",defaultValue = "1")int pageNum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		int totalRowCount = service.count();
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 6, 5);
		map.put("startRow", pu.getStartRow() - 1);
		
		List<ReceiptVO> list = service.receipt_list(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		
		return ".receipt.receiveTuition";
	}
	
	
	@RequestMapping(value="/receipt/apply")
	public String receiptApply(Model model, int final_price, int pay_num) {	
		model.addAttribute("final_price", final_price);
		model.addAttribute("pay_num", pay_num);
		
		return ".receipt.applyRemit";
	}
	
	
	@RequestMapping(value="/receipt/insert", method = RequestMethod.POST)
	public String insert(int rem_pay, String rem_bank, String rem_account, int pay_num) {
		//System.out.println(rem_pay);
		//System.out.println(rem_bank);
		//System.out.println(rem_account);
		//System.out.println(pay_num);
		
		InsertRemitVO vo = new InsertRemitVO(pay_num, rem_pay, rem_bank, rem_account);
		int n  = service.insertRemit(vo);
		
		
		
		return ".receipt.receiveTuition";
	}
	
	
}
