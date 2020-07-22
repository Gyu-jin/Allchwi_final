package com.jhta.allchwi.controller.login;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.allchwi.service.login.KakaoLoginService;
import com.jhta.allchwi.service.login.MemberLoginService;
import com.jhta.allchwi.vo.login.MemberLoginVO;
@Controller
public class KakaoLoginController {
	
	@Autowired
	private KakaoLoginService kls;
	
	@Autowired
	private MemberLoginService mls;
	
	@RequestMapping(value = "/login/login")
	//카카오 로그인페이지로 이동
	public String goLoginPage() {
		String client_id = "4f883a7141cac9d993029eba73513c89";
		String redirect_uri = "http://localhost:8091/allchwi/login/kakaologin";
		String path = "https://kauth.kakao.com/oauth/authorize?client_id="+ client_id + "&redirect_uri=" + redirect_uri + "&response_type=code";
		return "redirect:" + path;
	}
	
	@RequestMapping(value = "/login/kakaologin")
	public String kakaologin(@RequestParam("code") String code, HttpSession session, Model model) {
		//a url에 담겨져 있는  code 값을 통해 
		String access_Token = kls.getAccessToken(code);
		HashMap<String, Object> kakaoUserInfo = kls.getUserInfo(access_Token);
		String kakaoEmail = (String)kakaoUserInfo.get("email");
		//kakao 이메일 계정이 있을 경우 
		if(kakaoEmail != "" || kakaoEmail != null) {
			//a 카카오 이메일로 회원정보가 있는지 검색
			MemberLoginVO infoCheckVo = mls.idCheck(kakaoEmail);
			//a 회원정보 존재 -> 가입된 회원
			if (infoCheckVo != null) {
				//a 로그인번호를 세션에 저장
				session.setAttribute("ml_num", infoCheckVo.getMl_num());
				//a 튜터 인증을 받은 회원일 경우 세션에 저장
				if(infoCheckVo.getTutor_auth() != 0) {
					//a 튜터인증 여부 저장 - 나중에 등록 시 필요
					session.setAttribute("tutor_auth", infoCheckVo.getTutor_auth());
				}
				//a kakao회원인지 아닌지 구분을 위해 세션에 토큰 저장
				session.setAttribute("access_Token", access_Token);
				return "redirect:/";
			} else {
				//0 회원정보 없음 -> 미가입 회원
				try {
					int result = mls.kakaoJoinMember(session, kakaoUserInfo);
					if(result == 4) {
						//a 저장된 회원정보 중 로그인테이블에서 구분을 위해  값을 vo에 담기
						MemberLoginVO getInfoVo = mls.idCheck(kakaoEmail);
						//a 로그인번호를 세션에 저장
						session.setAttribute("ml_num", getInfoVo.getMl_num());
						//a kakao회원인지 아닌지 구분을 위해 세션에 토큰 저장
						session.setAttribute("access_Token", access_Token);
						return "redirect:/";						
					}
					return ".error.error";
				} catch (Exception e) {
					//exception 발생시 에러페이지로 이동
					e.printStackTrace();
					return ".error.error";
				}
			}
		} else {
			System.out.println("회원정보중에 카카오 계정이 없대요");
			return ".error.error";			
		}
	}
}
