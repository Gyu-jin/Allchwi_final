package com.jhta.allchwi.service.onlineclass;

import java.sql.SQLException;
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

	public OnlineClassVO select(int online_num) {
		return dao.select(online_num);
	}

	public void update(OnlineClassVO updateVo) {
		dao.update(updateVo);
	}

	public void delete(int online_num) throws SQLException {
		dao.delete(online_num);
	}

}
