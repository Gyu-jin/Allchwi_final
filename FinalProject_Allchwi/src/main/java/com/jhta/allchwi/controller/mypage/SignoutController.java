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
public class SignoutController {
	//회원탈퇴 페이지로 이동
	@GetMapping("/mypage/signout")
	public String goPage() {
		return ".mypage.signout";
	}
}
