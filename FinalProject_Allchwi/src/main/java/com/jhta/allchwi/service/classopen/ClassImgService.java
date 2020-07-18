package com.jhta.allchwi.service.classopen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classopen.ClassImgDAO;
import com.jhta.allchwi.vo.classopen.ClassImgVO;

@Service
public class ClassImgService {
	@Autowired
	private ClassImgDAO dao;
	
	public int insert(ClassImgVO vo) {
		return dao.insert(vo);
	}
	
	public ClassImgVO getImg(int cover_num) {
		return dao.getImg(cover_num);
	}
}
