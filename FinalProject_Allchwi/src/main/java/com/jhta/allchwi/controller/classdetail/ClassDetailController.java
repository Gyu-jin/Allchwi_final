package com.jhta.allchwi.controller.classdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.service.classdetail.ClassQnaService;
import com.jhta.allchwi.service.classdetail.ClassReviewService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.classdetail.ClassQnaVO;
import com.jhta.allchwi.vo.classdetail.ClassReviewVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;



@Controller
public class ClassDetailController {
	@Autowired
	private ClassInfoService classinfo_service;
	@Autowired
	private ClassReviewService classreview_service;
	
	@GetMapping("/classDetail/detail")
	public ModelAndView detail(int class_num) {
		ModelAndView mv=new ModelAndView(".classDetail.detail");
		ClassInfoVO cvo=classinfo_service.getInfo(class_num);
		List<ClassReviewVO> rlist=classreview_service.reviewList(class_num);
		String id="test";
		mv.addObject("id", id);
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
