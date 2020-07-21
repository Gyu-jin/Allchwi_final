package com.jhta.allchwi.controller.myClassManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.service.myclassmanage.MyClassManageService;
import com.jhta.allchwi.vo.classapply.ClassApplyVO;

@Controller
public class ConfirmMyClassController {
	@Autowired
	private MyClassManageService mcms;
	
	@RequestMapping("/myClass/classAccept")
	public String goClassAccept(@RequestParam(value = "apply_num") int apply_num, Model model) {
		//신청서 번호로 신청한 회원정보 가져오기
		ClassApplyVO cav = mcms.getApply(apply_num);
		//모델객체에 vo 담기
		model.addAttribute("cav", cav);
		//모달창으로 이동
		return "myClass/classAccept";
	}
	@RequestMapping("/myClass/classAcceptUpdate")
	public String updateApply(@RequestParam(value = "apply_num") int apply_num) {
		int result = mcms.updateApply(apply_num);
		if(result > 0) {
			System.out.println("어디가니");
			return "redirect:/myClass/myClassManage";			
		} else {
			System.out.println("어디가니2");
			return "redirect:/";
		}
	}
}
