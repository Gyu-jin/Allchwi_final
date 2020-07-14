package com.jhta.allchwi.service.classdetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classdetail.ClassQnaDAO;
import com.jhta.allchwi.vo.classqna.ClassQnaVO;

@Service
public class ClassQnaService {
	@Autowired private static ClassQnaDAO dao;
	
	public static int insertQna(ClassQnaVO vo) {
		return dao.insertQna(vo);
	}
	public static int insertReply(ClassQnaVO vo) {
		return dao.insertReply(vo);
	}
}

