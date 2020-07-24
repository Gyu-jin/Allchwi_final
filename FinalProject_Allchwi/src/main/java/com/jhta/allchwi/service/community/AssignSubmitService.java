package com.jhta.allchwi.service.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.community.AssignSubmitDAO;
import com.jhta.allchwi.vo.community.AssignSubmitVO;

@Service
public class AssignSubmitService {
	@Autowired private AssignSubmitDAO dao;
	
	public int insert(AssignSubmitVO vo) {
		return dao.insert(vo);
	}
}
