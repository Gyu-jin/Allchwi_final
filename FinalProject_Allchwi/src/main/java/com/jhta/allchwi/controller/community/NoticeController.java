package com.jhta.allchwi.controller.community;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.community.NoticeService;
import com.jhta.allchwi.vo.community.CommunityVO;
import com.jhta.allchwi.vo.community.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService nts;
	
	//a 커뮤니티 페이지로 이동
	@GetMapping("/community/notice")
	public String goNotice(Model model,HttpSession session, @RequestParam(value="pageNum",defaultValue = "1") int pageNum) {
		//페이징 처리를 위한 값을 담기 위해 map 선언
		HashMap<String, Object> map = new HashMap<String, Object>();
		//세션에 저장 되어있는 commuVo 꺼내오기
		CommunityVO commu = (CommunityVO)session.getAttribute("commuInfo");
		//VO에서 커뮤니티 번호 가져오기
		int commu_num = commu.getCommu_num();
		map.put("commu_num", commu_num);
		int totalRowCount = nts.count(map);
		//페이징 처리 위한 객체 불러오기
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		//객체를 통해 시작페이지를 map에 담기, 0부터 시작하므로 -1
		map.put("startRow", pu.getStartRow()-1);
		//페이징 처리된 목록 가져오기
		List<NoticeVO> list = nts.noticeList(map);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);
		return ".community.notice.main";
	}
	//a 공지글 작성 모달창 띄우기
	@RequestMapping("/community/notice/writeNotice")
	public String writeNotice(HttpSession session, Model model) {
		//페이징 처리를 위한 값을 담기 위해 map 선언
		HashMap<String, Object> map = new HashMap<String, Object>();
		//세션에 저장 되어있는 commuVo 꺼내오기
		CommunityVO commu = (CommunityVO)session.getAttribute("commuInfo");
		model.addAttribute("commu", commu);		
		return "community/notice/writeNotice";
	}
	//a 모달창에서 값을 가지고 컨트롤러로 이동
	@RequestMapping("/community/notice/insertNotice")
	public String insertNotice(NoticeVO ntv) {
		int result = nts.writeNotice(ntv);
		//insert 후 공지사항 페이지로 리다이렉트 
		return "redirect:/community/notice";
	}
	//관리자인 경우에만 글 등록 가능
	@RequestMapping(value = "/adminCheck.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String adminCheck(int ml_num, int class_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		JSONObject json = new JSONObject();
		map.put("ml_num", ml_num);
		map.put("class_num", class_num);
		
		int result = nts.adminCheck(map);
		if (result == 1) {
			//카운트 1 -> 관리자 o 
			json.put("code", "success");
		} else {
			//카운트 0 -> 관리자 x
			json.put("code", "fail");
		}
		return json.toString();
	}
}
