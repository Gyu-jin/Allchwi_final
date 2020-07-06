package com.jhta.allchwi.controller.login;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.login.MemberLoginService;
import com.jhta.allchwi.vo.login.MemberLoginVO;

@Controller
public class LoginMainController {
	@Autowired
	private MemberLoginService mls;	

	@GetMapping("/login/main")
	public String adminMain() {
		return ".login.main";
	}
	
	@RequestMapping(value = "/login/join", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String idCheck(String id) {
		System.out.println(id);
		MemberLoginVO vo = mls.idCheck(id);
		System.out.println(vo);
		JSONObject json=new JSONObject();
		if(vo != null) {
			json.put("code", "fail");
		} else {
			json.put("code", "success");
		}
		return json.toString();
	}
}
