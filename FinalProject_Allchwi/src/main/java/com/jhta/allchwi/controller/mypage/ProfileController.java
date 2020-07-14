package com.jhta.allchwi.controller.mypage;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.allchwi.service.login.MemberInfoService;
import com.jhta.allchwi.vo.login.ProfileVO;
import com.jhta.allchwi.vo.profileImg.ProfileImgVO;

@Controller
public class ProfileController {
	@Autowired
	private MemberInfoService mis;
	//1 회원프로필 페이지로 이동
	@GetMapping("/mypage/mypageForm")
	public String goMypage(HttpSession session, Model model) {
		//a 세션에 저장되어있는 회원번호 가져오기
		int ml_num = (int)session.getAttribute("ml_num");
		//a 서비스 메소드 가져와 vo 값 받기
		ProfileVO pfv = mis.selectInfo(ml_num);
		//a 모델 객체에 값 담아주기
		model.addAttribute("result", pfv);
		return ".mypage.profile";
	}
	//2 profile 값 DB에 저장후 이동
	@PostMapping("/mypage/mypageForm")
	public String updateMypage(HttpSession session, 
			@RequestParam("pro_img")MultipartFile img, ProfileVO pfv) {
		ProfileImgVO piv = null;
		boolean b;
		//a 세션에 저장되어있는 회원번호 가져오기
		int ml_num = (int)session.getAttribute("ml_num");
		System.out.println("회원번호" + ml_num);
		//a 회원번호 pfv에 담아주기
		pfv.setMl_num(ml_num);
		//a 프로필 이미지 업로드
		System.out.println(img + "이미지값");
		if(!img.isEmpty()) {
			//a 프로필이미지 파일명
			String proImgName = img.getOriginalFilename();
			System.out.println(proImgName + "이미지 파일이름");
			//a vo에 담을 바이트 이미지 파일
			byte[] proImgFile = null; 
			try {
				//multipart로 얻은 File 바이트형식으로 바꿔 저장
				proImgFile = img.getBytes(); 
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			//a 프로필이미지 VO에 값 넘겨주기
			piv = new ProfileImgVO(0, proImgFile, proImgName,null);
		}
		try {
			b = mis.updateInfo(piv, pfv);
			System.out.println(b + "너 뭐냐");
			if(b) {
				return "redirect:/";			
			} else {
				return ".error.error";
			}
		} catch (Exception e) {
			System.out.println("무슨에러");
			e.printStackTrace();
			return ".error.error";
		}
	}
}
