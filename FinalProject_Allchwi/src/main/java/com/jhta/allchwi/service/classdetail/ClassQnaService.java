package com.jhta.allchwi.service.classdetail;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classdetail.ClassQnaDAO;
import com.jhta.allchwi.vo.classdetail.ClassQnaVO;

@Service
public class ClassQnaService {
	@Autowired private ClassQnaDAO dao;
	
	public int insertQna(ClassQnaVO vo) {
		return dao.insertQna(vo);
	}
	public int insertReply(ClassQnaVO vo) {
		return dao.insertReply(vo);
	}
	public List<ClassQnaVO> qnaList(int class_num) {
		return dao.qnaList(class_num);
	}
	public List<ClassQnaVO> commList(HashMap<String, Object> map) {
		return dao.commList(map);
	}
}

