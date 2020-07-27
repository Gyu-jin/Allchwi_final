package com.jhta.allchwi.controller.community;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.community.CommunityService;
import com.jhta.allchwi.service.community.NoticeService;
import com.jhta.allchwi.vo.community.CommunityVO;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@Autowired
	private NoticeService nts;
	
	
	@GetMapping("/onclass/community")
	public String adminMain(HttpSession session,int class_num, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int ml_num = (int)session.getAttribute("ml_num");
		
		map.put("ml_num", ml_num);
		System.out.println(class_num + "  " +ml_num );
		map.put("class_num", class_num);
		
		CommunityVO vo = service.goCommu(map);
		System.out.println(ml_num +"  " + vo.getMl_num());
		if(vo!=null) {
			int noticeCount = nts.weekNotice(vo.getCommu_num()); 
			session.setAttribute("commuInfo", vo);
			session.setAttribute("noticeCount", noticeCount);
			return ".community";			
		}else {
			return ".error.error";
		}
		
		
	}
	
	
	@PostMapping("/class/community")
	@ResponseBody
	public String communityCreate(HttpSession session,int class_num,String commu_title) {
		
		int ml_num = (int)session.getAttribute("ml_num");
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("class_num", class_num);
		map.put("commu_title", commu_title);
		map.put("ml_num", ml_num);
		
		int n = service.selectChk(map);
		
		if(n > 0) {
			return "already";
		}else {
			try {
				service.insert(map);
			} catch (Exception e) {
				e.printStackTrace();
				return "fail";
			}
		}
		return "success";
	}
	
}
