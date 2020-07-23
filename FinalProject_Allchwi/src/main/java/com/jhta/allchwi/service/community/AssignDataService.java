package com.jhta.allchwi.service.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.community.AssignDataDAO;

@Service
public class AssignDataService {
	@Autowired private AssignDataDAO dao;
}
