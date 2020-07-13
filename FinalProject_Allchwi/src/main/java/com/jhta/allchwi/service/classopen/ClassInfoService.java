package com.jhta.allchwi.service.classopen;

import java.util.HashMap;
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
	//keyword 검색
	public List<ClassInfoVO> keyword_list(String keyword){
		return dao.keyword_list(keyword);
	}
	
	//category 검색
	public List<ClassInfoVO> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public int count(HashMap<String, Object> map) {
		return dao.count(map);
	}
}
