package com.jhta.allchwi.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.allchwi.service.login.MemberLoginService;
import com.jhta.allchwi.vo.login.MemberLoginVO;

@Controller
public class LoginMainController {
	@Autowired
	private MemberLoginService mls;

	// 1 로그인창으로 이동
	@GetMapping("/login/main")
	public String adminMain() {
		return ".login.main";
	}

	// 2 로그인정보 확인 - 로그인 처리
	@PostMapping("/login/signUp")
	public String loginCheck(HttpSession session, MemberLoginVO mlv, RedirectAttributes ras) {
		// 회원중에서 검색 - kakaoUser = 'n'인 회원
		mlv.setKakaoUser("n");
		int result = mls.loginCheck(mlv);
		// a 로그인 성공시
		if (result == 1) {
			// a 일치하는 회원정보 중 로그인번호만 뽑아 세션에 저장
			MemberLoginVO get = mls.sessionInfo(mlv);
			session.setAttribute("ml_num", get.getMl_num());
			if (get.getTutor_auth() != 0) {
				// a 튜터인증 여부 저장 - 나중에 등록 시 필요
				session.setAttribute("tutor_auth", get.getTutor_auth());
			}
			return "redirect:/";
			// a 회원탈퇴 처리된 회원일 경우
		} else if (result == 2) {
			// RedirectAttributes -> 리다이렉트 시점에 한 번만 사용되는 데이터를 전송할 수 있는
			// addFlashAttributes()기능 제공
			ras.addFlashAttribute("msg", "secession");
			return "redirect:/login/main";
			// a 로그인 실패
		} else {
			ras.addFlashAttribute("msg", "fail");
			return "redirect:/login/main";
		}
	}
}
