package com.jhta.allchwi.controller.classdetail;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.page.util.PageUtil;
import com.jhta.allchwi.service.classdetail.ClassDetailService;
import com.jhta.allchwi.service.classdetail.ClassReviewService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.service.login.MemberInfoService;
import com.jhta.allchwi.service.wishlist.WishListService;
import com.jhta.allchwi.vo.classdetail.ClassDetailVO;
import com.jhta.allchwi.vo.classdetail.ClassReviewVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;
import com.jhta.allchwi.vo.login.ProfileVO;



@Controller
public class ClassDetailController {
	@Autowired
	private ClassDetailService cd_service;
	@Autowired
	private ClassReviewService cr_service;
	@Autowired
	private MemberInfoService mis;
	@Autowired
	private WishListService wls;
	
	@GetMapping("/classDetail/detail")
	public ModelAndView detail(int class_num,HttpServletRequest req,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
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
		//getdetail
		HashMap<String, Object> map2=new HashMap<String, Object>();
		map2.put("class_num", class_num);
		ClassDetailVO cdv=cd_service.getDetail(map2);
		//리뷰페이징
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("class_num", class_num);
		int totalRowCount=cr_service.rcount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 4, 5);
		int startRow=pu.getStartRow()-1;
		map.put("startRow", startRow);	
		List<ClassReviewVO> rlist=cr_service.reviewList(map);

		mv.addObject("rlist", rlist);
		mv.addObject("rpu",pu);
		mv.addObject("cdv", cdv);
	    mv.addObject("class_num", class_num);
		return mv;
	}

	// 인표 상세페이지 이동 detail2
	@GetMapping("/classDetail/detail2")
	public ModelAndView detail2(int class_num,HttpServletRequest req,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
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
		HashMap<String, Object> map2=new HashMap<String, Object>();
		map2.put("class_num", class_num);
		ClassDetailVO cdv=cd_service.getDetail(map2);
		System.out.println(cdv.getBloc_name());
		//리뷰페이징
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("class_num", class_num);
		int totalRowCount=cr_service.rcount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 4, 5);
		int startRow=pu.getStartRow()-1;
		map.put("startRow", startRow);	
		List<ClassReviewVO> rlist=cr_service.reviewList(map);

		mv.addObject("rlist", rlist);
		mv.addObject("rpu",pu);
		mv.addObject("cdv", cdv);
	    mv.addObject("class_num", class_num);
		return mv;
	}

}
