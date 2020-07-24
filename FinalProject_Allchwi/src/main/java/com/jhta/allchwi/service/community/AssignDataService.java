package com.jhta.allchwi.service.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.community.AssignDataDAO;
import com.jhta.allchwi.vo.community.AssignDataVO;

@Service
public class AssignDataService {
	@Autowired private AssignDataDAO dao;
	
	public int insert(AssignDataVO vo) {
		return dao.insert(vo);
	}
}
