package com.jhta.allchwi.service.classopen;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classopen.ClassInfoDAO;
import com.jhta.allchwi.vo.classopen.ClassInfoVO;

@Service
public class ClassInfoService {
	@Autowired
	private ClassInfoDAO dao;
	
	public int insert(ClassInfoVO vo) {
		return dao.insert(vo);
	}
	
	public List<ClassInfoVO> list(int bcategory_num){
		return dao.list(bcategory_num);
	}
}
