package com.jhta.allchwi.controller.classdetail;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.classdetail.ClassQnaService;
import com.jhta.allchwi.vo.classdetail.ClassQnaVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;


@Controller
public class ClassQnaController {
	@Autowired
	private ClassQnaService service;
	
	@PostMapping("/classDetail/qna")
	@ResponseBody
	public String insertQna(ClassQnaVO qvo) {
		try {
			service.insertQna(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	@PostMapping("/classDetail/qnareply")
	@ResponseBody
	public String insertRelply(ClassQnaVO qvo) {
		try {
			service.insertReply(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	@GetMapping("/classDetail/qnalist")
	@ResponseBody
	public List<ClassQnaVO> qnaList(int class_num,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("class_num", class_num);
		map.put("startRow", 1);
//		int totalRowCount=service.count(map);
//		PageUtil pu=new PageUtil(1, totalRowCount, 4, 5);
//		
//		System.out.println("endPageNUm : "+pu.getEndPageNum());
//		System.out.println("총 글의 갯수 : " +totalRowCount);
//		
//		int startRow=pu.getStartRow()-1;
//		map.put("startRow", startRow);	
		List<ClassQnaVO> qlist=service.qnaList(map);
//		mv.addObject("pu",pu);
//		mv.addObject("qlist",qlist);
		return qlist;
	}
	@GetMapping("/classDetail/commlist")
	@ResponseBody
	public List<ClassQnaVO> commList(@RequestParam HashMap<String, Object> map){;
		List<ClassQnaVO> commlist=service.commList(map);
		return commlist;
	}
}
