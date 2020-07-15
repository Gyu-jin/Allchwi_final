package com.jhta.allchwi.controller.classapply;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.allchwi.service.classapply.ClassApplyService;
import com.jhta.allchwi.service.classopen.ClassDateService;
import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.vo.classapply.ClassApplyVO;
import com.jhta.allchwi.vo.classopen.ClassDateVO;


@Controller
public class ClassApplyController {
	@Autowired private ClassApplyService classApply_service;
	@Autowired private ClassDateService classDate_service;
	@Autowired private ClassInfoService classInfo_service;
	
	//class_num에 해당하는 수업 신청서 페이지로 이동
	@RequestMapping(value="/class/apply", method = RequestMethod.GET)
	public ModelAndView goClassapply(int class_num) {
		ModelAndView mv=new ModelAndView(".classapply.ClassApply");
		List<ClassDateVO> classDate_list=classDate_service.list(class_num);
		mv.addObject("classDate_list",classDate_list);
		return mv;
	}
	
	// 수업신청 테이블에 필요한 데이터 받아서 insert할 예정.. , ajax callback함수에 success 문자열 전송
	@RequestMapping(value="/class/applyOk", method = RequestMethod.POST)
	public ModelAndView classApplyOk(int date_num, int ml_num, int stu_lev, String stu_msg, String stu_phone,String point) {
		System.out.println("apply post mapping.. 포인트 값 : " + point);
		ClassApplyVO vo=new ClassApplyVO(0, date_num, ml_num, stu_lev, stu_msg, stu_phone, 0, 0, null);
		ModelAndView mv=new ModelAndView(".classapply.success");
		int n=classApply_service.insert(vo);
		if(n>0) {
			mv.addObject("code","success");			
		}else {
			mv.addObject("code","fail");	
		}
		return mv;

	}
	
	// 수업신청 성공 시 페이지 이동하는 메소드
	@RequestMapping(value="/class/success", method = RequestMethod.GET)
	public String goSuccess(String date_num,Model model) {
		System.out.println("성공!");
		model.addAttribute("date_num",date_num);
		return ".classapply.success";
	}
}
