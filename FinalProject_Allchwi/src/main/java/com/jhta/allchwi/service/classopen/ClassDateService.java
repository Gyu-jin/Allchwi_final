package com.jhta.allchwi.service.classopen;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classopen.ClassDateDAO;
import com.jhta.allchwi.vo.classopen.ClassDateVO;

@Service
public class ClassDateService {
	@Autowired private ClassDateDAO dao;
	
	public List<ClassDateVO> list(int class_num){
		return dao.list(class_num);
	}

	public int insert(ClassDateVO vo) {
		
		return dao.insert(vo);
	}
}
