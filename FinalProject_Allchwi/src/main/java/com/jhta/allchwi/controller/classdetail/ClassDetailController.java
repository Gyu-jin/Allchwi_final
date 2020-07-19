package com.jhta.allchwi.controller.classdetail;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.service.classdetail.ClassQnaService;
import com.jhta.allchwi.service.classdetail.ClassReviewService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.service.login.MemberInfoService;
import com.jhta.allchwi.service.wishlist.WishListService;
import com.jhta.allchwi.vo.classdetail.ClassQnaVO;
import com.jhta.allchwi.vo.classdetail.ClassReviewVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.login.MemberInfoVO;
import com.jhta.allchwi.vo.login.ProfileVO;
import com.jhta.allchwi.vo.wishlist.WishListVO;



@Controller
public class ClassDetailController {
	@Autowired
	private ClassInfoService classinfo_service;
	@Autowired
	private ClassReviewService classreview_service;
	@Autowired
	private MemberInfoService mis;
	@Autowired
	private WishListService wls;
	
	@GetMapping("/classDetail/detail")
	public ModelAndView detail(int class_num,HttpServletRequest req) {
		ServletContext sc=req.getSession().getServletContext();
		if(req.getSession().getAttribute("ml_num") != null ) {
			int ml_num = (int)req.getSession().getAttribute("ml_num");
			if(wls.getWish(ml_num) != null) {
				sc.setAttribute("wstatus", true);
			}
			if(mis.selectInfo(ml_num) != null) {
				ProfileVO pfv = mis.selectInfo(ml_num);
				sc.setAttribute("mem", pfv);
			}else {
				sc.setAttribute("mem", ml_num);
			}
		}
		ModelAndView mv=new ModelAndView(".classDetail.detail");
		ClassInfoVO cvo=classinfo_service.getInfo(class_num);

		List<ClassReviewVO> rlist=classreview_service.reviewList(class_num);
		mv.addObject("rlist", rlist);
		mv.addObject("cvo", cvo);
	    mv.addObject("class_num", class_num);
		return mv;
	}

	// 인표 상세페이지 이동 detail2
	@GetMapping("/classDetail/detail2")
	public ModelAndView detail2(int class_num) {
		ModelAndView mv=new ModelAndView("classDetail/detail");
		ClassInfoVO cvo=classinfo_service.getInfo(class_num);
		List<ClassReviewVO> rlist=classreview_service.reviewList(class_num);
		String id="test";
		mv.addObject("id", id);
		mv.addObject("rlist", rlist);
		mv.addObject("cvo", cvo);
		mv.addObject("class_num", class_num);
		return mv;
	}

}
