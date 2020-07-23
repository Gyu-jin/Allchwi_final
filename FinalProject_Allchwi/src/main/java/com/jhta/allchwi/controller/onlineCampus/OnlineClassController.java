package com.jhta.allchwi.controller.onlineCampus;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OnlineClassController {
	
	@GetMapping("/community/mediaList")
	public String goOnlineClass(HttpSession session,Model model) {
		return ".community.onlineCampus.mediaList";
	}
	
	@GetMapping("/community/mediaModal")
	public String showModal(HttpSession session, int commu_num) {
		return "community/onlineCampus/fileuploadModal";
	}
}
