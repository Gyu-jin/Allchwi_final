package com.jhta.allchwi.controller.classdetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.classapply.PaymentService;
import com.jhta.allchwi.service.classdetail.ClassReviewService;
import com.jhta.allchwi.vo.classdetail.ClassReviewVO;

@Controller
public class ClassReviewController {
	@Autowired
	private ClassReviewService crs;
	@Autowired
	private PaymentService ps;
	@PostMapping("/classDetail/insertreview")
	@ResponseBody
	public String insertReview(ClassReviewVO rvo) {
		try {
			crs.insertReview(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
}
