package com.jhta.allchwi.service.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.community.AssignmentDAO;

@Service
public class AssignmentService {
	@Autowired private AssignmentDAO dao;
}
