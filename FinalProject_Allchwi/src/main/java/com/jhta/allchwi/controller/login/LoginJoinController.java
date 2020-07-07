package com.jhta.allchwi.controller.login;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.login.MemberLoginService;
import com.jhta.allchwi.vo.login.MemberLoginVO;

@Controller
public class LoginJoinController {
	@Autowired
	private MemberLoginService mls;
	
	//회원가입 페이지 이동
	@GetMapping("/login/join")
	public String goJoin() {
		return ".login.join";
	}

	@RequestMapping(value = "/CheckID.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String idCheck(String id) {
		System.out.println(id);
		// 아이디 검색 결과를 vo에 넣어줌.
		MemberLoginVO vo = mls.idCheck(id);
		System.out.println(vo);
		JSONObject json = new JSONObject();
		// 검색된 아이디가 존재하면
		if (vo != null) {
			// 아이디가 존재 -> 사용할 수 없음
			json.put("code", "fail");
		} else {
			// 아이디가 없음 -> 사용 가능
			json.put("code", "success");
		}
		// json 형태로 나타냄
		return json.toString();
	}
	
	//비밀번호찾기 페이지 이동
	@GetMapping("/login/searchPwd")
	public String goSearchPwd() {
		return ".login.searchPwd";
	}
}
