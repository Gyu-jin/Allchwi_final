package com.jhta.allchwi.controller.mypage;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jhta.allchwi.service.login.MemberInfoService;
import com.jhta.allchwi.vo.login.MemberInfoVO;
import com.jhta.allchwi.vo.login.MemberLoginVO;



@Controller
public class SignoutController {
	@Autowired
	private MemberInfoService mis;
	
	//회원탈퇴 페이지로 이동
	@GetMapping("/mypage/signout")
	public String goPage() {
		return ".mypage.signout";
	}
	//회원정보 업데이트 하기
	@PostMapping("/mypage/signout")
	public String signout(MemberLoginVO mlv, MemberInfoVO miv) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		// 값 넘어오는지 확인
		System.out.println("id : " + mlv.getId());
		System.out.println("pwd : " + mlv.getPwd());
		System.out.println("mb_reason : " + miv.getMb_reason());
		//해쉬맵에 값 담기
		hm.put("mb_num", miv.getMb_num());
		hm.put("mb_reason", miv.getMb_reason());
		//탈퇴 요청 상태로 넘기기
		hm.put("mb_auth", 1);
		int result = mis.UpdateSignout(hm);
		if(result > 0) {
			return "redirect:/";			
		} else {
			return ".error.error";
		}
	}
}
