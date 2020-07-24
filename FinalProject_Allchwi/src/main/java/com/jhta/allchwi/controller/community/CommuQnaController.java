package com.jhta.allchwi.controller.community;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.community.CommuQnaService;
import com.jhta.allchwi.vo.community.CommuQnaVO;

@Controller
public class CommuQnaController {
	@Autowired
	private CommuQnaService service;
	
	@GetMapping("/community/qna")
	public String goQna() {
		return ".community.qna.commuQna";
	}
	@PostMapping("/community/insertQna")
	@ResponseBody
	public String insertQna(CommuQnaVO qvo) {
		try {
			service.insertQna(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	@PostMapping("/community/qnareply")
	@ResponseBody
	public String insertRelply(CommuQnaVO qvo) {
		try {
			service.insertReply(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	@GetMapping("/community/qnalist")
	@ResponseBody
	public HashMap<String, Object> qnaList(int commu_num,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("commu_num", commu_num);
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 4, 5);
		int startRow=pu.getStartRow()-1;
		map.put("startRow", startRow);	
		List<CommuQnaVO> qlist=service.qnaList(map);
		HashMap<String, Object> map1=new HashMap<String, Object>();
		map1.put("pu",pu);
		map1.put("qlist",qlist);
		return map1;
	}
	@GetMapping("/community/commlist")
	@ResponseBody
	public List<CommuQnaVO> commList(@RequestParam HashMap<String, Object> map){;
		List<CommuQnaVO> commlist=service.commList(map);
		return commlist;
	}
}
