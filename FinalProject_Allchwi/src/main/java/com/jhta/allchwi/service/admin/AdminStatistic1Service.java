package com.jhta.allchwi.service.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.admin.Statistic1DAO;
import com.jhta.allchwi.vo.admin.Statistic1VO;

@Service
public class AdminStatistic1Service {
	@Autowired
	private Statistic1DAO dao;
	
	public List<Statistic1VO> list(int thisyear, int nextyear) {

		return dao.list(thisyear, nextyear);
	
	}
	
	
}
