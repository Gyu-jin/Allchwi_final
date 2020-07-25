package com.jhta.allchwi.service.onlineclass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.onlineClass.OnlineCheckDAO;

@Service
public class OnlineCheckService {
	@Autowired
	private OnlineCheckDAO dao;
	
}
