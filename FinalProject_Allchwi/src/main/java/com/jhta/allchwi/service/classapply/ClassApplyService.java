package com.jhta.allchwi.service.classapply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classapply.ClassApplyDAO;
import com.jhta.allchwi.vo.classapply.ClassApplyVO;

@Service
public class ClassApplyService {
	@Autowired private ClassApplyDAO dao;
	
	public int insert(ClassApplyVO vo) {
		return dao.insert(vo);
	}
}
