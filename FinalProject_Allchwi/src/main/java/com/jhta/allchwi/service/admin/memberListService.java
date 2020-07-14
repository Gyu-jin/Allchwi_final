package com.jhta.allchwi.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.allchwi.dao.admin.memberListDAO;
import com.jhta.allchwi.vo.admin.MemberListVO;

@Service
public class memberListService {
	@Autowired
	private memberListDAO dao;
	
	public List<MemberListVO> member_list(){
		return dao.member_list();
	}

	@Transactional
	public int update_mlnum (int ml_num) throws Exception {
		dao.update_mlnum_ml(ml_num);
		dao.update_mlnum_mi(ml_num);
		return 1;
	}
	
	
}

