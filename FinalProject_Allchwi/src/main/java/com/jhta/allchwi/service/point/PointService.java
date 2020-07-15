package com.jhta.allchwi.service.point;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.point.PointDAO;
import com.jhta.allchwi.vo.point.PointListVO;

@Service
public class PointService {
	@Autowired
	private PointDAO pd;
	//회원번호 받아 포인트 리스트 출력
	public List<PointListVO> pointList(HttpSession session, HashMap<String, Object> hm){
		//세션에서 회원번호를 받아 회원번호를 hashmap에 저장
		hm.put("ml_num", session.getAttribute("ml_num"));
		return pd.pointList(hm);
	}
	//현재 보유포인트 계산
	public int getTotal(HttpSession session, HashMap<String, Object> hm){
		//세션에서 회원번호를 받아 회원번호를 hashmap에 저장
		hm.put("ml_num", session.getAttribute("ml_num"));
		return pd.getTotal(hm);
	}
}
