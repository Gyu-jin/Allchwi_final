package com.jhta.allchwi.service.login;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jhta.allchwi.dao.login.MemberLoginDAO;
import com.jhta.allchwi.vo.login.MemberLoginVO;

@Service
public class MailSenderService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSession session;
	@Autowired
	private MemberLoginDAO mld;
	
	//난수를이용해 비밀번호를 재생성하기
	private boolean lowerCheck;
	private int size;

	//비밀번호 난수 만들기
	private String init() {
		Random rd = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		do {
			num = rd.nextInt(89) + 33;
			if ((num >= 33 && num <= 39)||(num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				//아스키코드로 변환 특문, 숫자, 대문자, 소문자
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		//9글자 만들고 나서 마지막에 특수문자 하나 추가해주기
		sb.append("!");
		//대소문자 구분 할건지 체크
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	//메소드 이용하여 변경된 비밀번호생성
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	//비밀번호 변경하여 이메일 발송
	public void mailSendWithpassword(MemberLoginVO mlv, String sendEmail, Model model, HttpServletRequest req) {
		//아이디와 비밀번호를 담기 위한 hashmap
		HashMap<String, Object> hm = new HashMap<String, Object>();
		//변경된 비밀번호
		String key = getKey(true, 9);
		hm.put("id", mlv.getId());
		hm.put("pwd", key);
	}
}
