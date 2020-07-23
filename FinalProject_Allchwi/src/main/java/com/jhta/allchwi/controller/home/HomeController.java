package com.jhta.allchwi.controller.home;


import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.allchwi.service.classdetail.ClassDetailService;
import com.jhta.allchwi.service.login.MemberInfoService;
import com.jhta.allchwi.service.wishlist.WishListService;
import com.jhta.allchwi.vo.classdetail.ClassDetailVO;
import com.jhta.allchwi.vo.login.ProfileVO;
import com.jhta.allchwi.vo.wishlist.WishListVO;

@Controller
public class HomeController {
	@Autowired
	private MemberInfoService mis;
	@Autowired private ClassDetailService detail_service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,HttpServletRequest req, Model model) {
		ServletContext sc=req.getSession().getServletContext();
		sc.setAttribute("cp", req.getContextPath());
		//a 로그인하여 세션에 회원번호가 저장되었을때 
		if(req.getSession().getAttribute("ml_num") != null ) {
			//a 메인 닉네임 및 이름 출력위해 세션에 저장된 회원번호 가져오기
			int ml_num = (int)req.getSession().getAttribute("ml_num");
			//a 회원번호 사용하여 vo에 이미지 및 이름, 닉네임 담기
			ProfileVO pfv = mis.selectInfo(ml_num);
			//model에 vo 객체 담아 보내기
			sc.setAttribute("mem", pfv);
		}
		
		List<ClassDetailVO> top_list=detail_service.topFive();
		model.addAttribute("top_list",top_list);
		
		return ".main";
	}
	
}
