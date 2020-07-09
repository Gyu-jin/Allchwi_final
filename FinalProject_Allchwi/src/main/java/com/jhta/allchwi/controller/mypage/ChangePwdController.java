package com.jhta.allchwi.controller.mypage;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.login.MemberLoginService;
import com.jhta.allchwi.vo.login.MemberLoginVO;


@Controller
public class ChangePwdController {
	@Autowired
	private MemberLoginService mls;
	
	//비밀번호 변경 페이지로 이동
	@GetMapping("/mypage/changePwd")
	public String goPage() {
		return ".mypage.changePwd";
	}
	//현재 비밀번호 확인 ajax
	@RequestMapping(value = "/CheckPWD.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String checkPwd(String id, String pwd) {
		System.out.println(id + "  " + pwd + "넘겨주는 아이디");
		//검색을 위해 hashmap에 조건을 넣어줌.
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("id", id);
		hm.put("pwd", pwd);
		
		//0 비밀번호 검색 결과를 vo에 넣어줌.
		MemberLoginVO vo = mls.checkPwd(hm);
		
		System.out.println(vo);
		
		JSONObject json = new JSONObject();
		//0 검색된 결과가 없으면
		if (vo == null) {
			//비밀번호가 일치하지 않습니다.
			json.put("code", "fail");
		} else {
			//비밀번호가 일치합니다.
			json.put("code", "success");
		}
		// json 형태로 나타냄
		return json.toString();
	}
	
	//비밀번호 변경 처리후 메인페이지로 리다이렉트
	@PostMapping("/mypage/changePwd")
	public String changePassword(MemberLoginVO mlv, String currPwd) {
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("id", mlv.getId());
		hm.put("pwd", mlv.getPwd());
		hm.put("prevPwd", currPwd);
		int result = mls.changePwd(hm);
		if(result > 0) {
			return "redirect:/";			
		} else {
			return ".mypage.changePwd";
		}
	}
}
