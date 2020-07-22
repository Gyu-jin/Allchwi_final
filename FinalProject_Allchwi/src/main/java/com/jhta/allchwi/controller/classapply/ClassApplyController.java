package com.jhta.allchwi.controller.classapply;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.service.classapply.ClassApplyService;
import com.jhta.allchwi.service.classopen.ClassDateService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.service.point.PointService;
import com.jhta.allchwi.vo.classapply.ClassApplyVO;
import com.jhta.allchwi.vo.classapply.PaymentVO;
import com.jhta.allchwi.vo.classopen.ClassDateVO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;


@Controller
public class ClassApplyController {
	@Autowired private ClassApplyService classApply_service;
	@Autowired private ClassDateService classDate_service;
	@Autowired private ClassInfoService classInfo_service;
	@Autowired private PointService point_service;
	
	//class_num에 해당하는 수업 신청서 페이지로 이동
	@RequestMapping(value="/class/apply", method = RequestMethod.GET)
	public ModelAndView goClassapply(int class_num,HttpServletRequest req) {
		ModelAndView mv=new ModelAndView(".classapply.ClassApply");
		HashMap<String, Object> map=new HashMap<String, Object>();
		int ml_num = (int)req.getSession().getAttribute("ml_num");
		map.put("ml_num",ml_num);
		List<ClassDateVO> classDate_list=classDate_service.select(class_num);
		int pro_num=classInfo_service.getProNum(class_num);
		int point=point_service.getTotal(map);
		mv.addObject("classDate_list",classDate_list);
		mv.addObject("point",point);
		mv.addObject("pro_num",pro_num);
		mv.addObject("class_num",class_num);
		ClassInfoVO vo = classInfo_service.select(class_num);
		req.setAttribute("class_form", vo.getClass_form());
		return mv;
	}
	
	// ClassApply & Payment table insert, ajax callback함수에 success 문자열 전송
	@RequestMapping(value="/class/applyOk",method = RequestMethod.POST)
	@ResponseBody
	public String classApplyOk(HttpSession session, ClassApplyVO vo, PaymentVO pvo, 
			@RequestParam(value="pay_point",defaultValue = "0") String pay_point) {
		System.out.println("apply post mapping.. 포인트 값 : " + pay_point);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("date_num",vo.getDate_num());
		map.put("class_num",pvo.getClass_num());
		map.put("ml_num",session.getAttribute("ml_num"));
		int n=classApply_service.check(map);
		if(n>0) {
			return "already";
		}
		
		try {
			classApply_service.insert(vo,pvo);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		

	}
	
	// 수업신청 성공 시 페이지 이동하는 메소드
	@RequestMapping(value="/class/success", method = RequestMethod.GET)
	public String goSuccess(String date_num,Model model) {
		System.out.println("성공!");
		model.addAttribute("date_num",date_num);
		return ".classapply.success";
	}
}
