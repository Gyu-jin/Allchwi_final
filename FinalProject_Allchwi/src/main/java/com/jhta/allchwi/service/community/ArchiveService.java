package com.jhta.allchwi.service.community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.community.ArchiveDAO;
import com.jhta.allchwi.vo.community.ArchiveVO;

@Service
public class ArchiveService {
	@Autowired
	private ArchiveDAO dao;
	
	public List<ArchiveVO> list(HashMap<String, Object>map){
		return dao.list(map);
	}
	
	public int count() {
		return dao.count();
	}
	
	
}
