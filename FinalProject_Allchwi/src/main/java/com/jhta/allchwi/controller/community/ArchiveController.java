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
import com.jhta.allchwi.vo.community.ArchiveVO;

@Controller
public class ArchiveController {
	@Autowired
	private ArchiveService service;
	
	@GetMapping("/community/archive")
	public String goAssign(Model model,@RequestParam(value="pageNum",defaultValue = "1") int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.count();
		
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 6, 5);
		map.put("startRow", pu.getStartRow()-1);
	
		List<ArchiveVO> list = service.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pu",pu);
		
		return ".community.board.archive";
	}
	
	
	@GetMapping("/community/archiveDetail")
	public String detail(int room_num,Model model) {
		service.hit(room_num);	//조회수 1증가
		ArchiveVO vo = service.detail(room_num);
		ArchiveVO next=service.next(room_num);//다음글
		ArchiveVO prev=service.prev(room_num);//다음글
		
		model.addAttribute("vo", vo);
		model.addAttribute("next",next);
		model.addAttribute("prev",prev);	
		return ".community.board.archiveContent";
	}
	
	

	@GetMapping("/community/writeContent")
	public String writeContent() {
		
		return ".community.board.writeArchiveContent";
	}
	
	
	
	
}
