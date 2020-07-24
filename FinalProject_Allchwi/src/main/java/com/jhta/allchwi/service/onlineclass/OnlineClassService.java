package com.jhta.allchwi.service.onlineclass;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.onlineClass.OnlineClassDAO;
import com.jhta.allchwi.vo.community.CommunityVO;
import com.jhta.allchwi.vo.onlineclass.OnlineClassVO;

@Service
public class OnlineClassService {
	@Autowired
	private OnlineClassDAO dao;
	
	public void classInsert(OnlineClassVO vo) {
		dao.classInsert(vo);
	}

	public List<OnlineClassVO> list(HashMap<String, Object> map) {
		return dao.list(map);
	}

	public int count(HashMap<String, Object> map) {
		return dao.count(map);
	}

	public OnlineClassVO getImg(int online_num) {
		return dao.getImg(online_num);
	}

}
