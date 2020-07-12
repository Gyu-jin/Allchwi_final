package com.jhta.allchwi.controller.login;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	//회원가입정보 포스트 방식으로 받기 
	@PostMapping("/login/join")
	public String signUp(MemberLoginVO mlv, @RequestParam("name")String name) {
		//hashmap에 파라미터로 넘어온 회원정보 담기
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("mlv", mlv);
		hm.put("name", name);
		//트랜잭션 처리한 service 메소드 필요
		return "redirect:/login/main";
	}
	
	//ajax로 아이디 중복확인
	@RequestMapping(value = "/CheckID.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String idCheck(String id) {
		System.out.println(id);
		//0 아이디 검색 결과를 vo에 넣어줌.
		MemberLoginVO vo = mls.idCheck(id);
		System.out.println(vo);
		JSONObject json = new JSONObject();
		//0 검색된 아이디가 존재하면
		if (vo != null) {
			//0 아이디가 존재 -> 사용할 수 없음
			json.put("code", "fail");
		} else {
			//0 아이디가 없음 -> 사용 가능
			json.put("code", "success");
		}
		// json 형태로 나타냄
		return json.toString();
	}
}
