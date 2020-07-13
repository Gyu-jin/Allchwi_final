package com.jhta.allchwi.service.location;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.location.BigLocationDAO;
import com.jhta.allchwi.vo.location.BigLocationVO;

@Service
public class BigLocationService {
	@Autowired
	BigLocationDAO dao;
	
	public int insert(BigLocationVO vo) {
		return dao.insert(vo);
	}
  
}
