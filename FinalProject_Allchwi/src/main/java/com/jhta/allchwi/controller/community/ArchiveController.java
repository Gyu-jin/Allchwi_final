package com.jhta.allchwi.controller.community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.community.ArchiveService;
import com.jhta.allchwi.vo.community.archive.ArchiveVO;

@Controller
public class ArchiveController {
	@Autowired
	private ArchiveService service;
	
	@GetMapping("/community/archive")
	public String goAssign(Model model,@RequestParam(value="pageNum",defaultValue = "1") int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		int totalRowCount = service.count();
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 6, 5);
		map.put("startRow", pu.getStartRow());
	
		List<ArchiveVO> list = service.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		
		return ".community.board.archive";
	}
}
