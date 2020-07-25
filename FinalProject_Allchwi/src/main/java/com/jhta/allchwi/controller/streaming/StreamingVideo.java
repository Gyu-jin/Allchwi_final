package com.jhta.allchwi.controller.streaming;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.ResourceRegion;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.service.onlineclass.OnlineCheckService;
import com.jhta.allchwi.service.onlineclass.OnlineClassService;

import org.springframework.http.*;

@Controller
public class StreamingVideo {
	@Autowired
	private OnlineCheckService check_service;
	@Autowired
	private OnlineClassService class_service;
	
	
	@GetMapping("/community/video")
	public String goOnlineClass(HttpSession session,int online_num) {
		return".community.onlineCampus.onlineClass";
	}
	
	@RequestMapping(value="/video/{name:.+}",method = RequestMethod.GET)
	public String goStreamView(@PathVariable("name") String name,Model model) { 
		model.addAttribute("movieName", name);
		return "streamView";
	}
	
	@PostMapping("/community/saveTime")
	public void OnlineTimeSave(HttpSession session,@RequestParam HashMap<String, Object> fd) {
		
		int saveTime = Integer.parseInt((String)fd.get("saveTime"));
		int online_num = Integer.parseInt((String)fd.get("online_num"));
		int ml_num = (int)session.getAttribute("nl_num");
		
		System.out.println(saveTime);
		
	}
	

}
