package com.jhta.allchwi.controller.streaming;

import java.io.IOException;

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
import org.springframework.http.*;

@Controller
public class StreamingVideo {
	
	@GetMapping("/community/video")
	public String goOnlineClass() {
		return".community.onlineCampus.onlineClass";
	}
	
	@RequestMapping(value="/video/{name:.+}",method = RequestMethod.GET)
	public String goStreamView(@PathVariable("name") String name,Model model) { 
		model.addAttribute("movieName", name);
		return "streamView";
	}
	
	
	

}
