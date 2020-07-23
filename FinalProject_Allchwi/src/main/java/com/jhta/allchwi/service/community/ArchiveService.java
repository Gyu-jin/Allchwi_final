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
	
	public int insert(ArchiveVO vo) {
		return dao.insert(vo);
	}
	
	public ArchiveVO getInfo(int room_num) {
		return dao.getInfo(room_num);
	}
	
	
	public List<ArchiveVO> list(HashMap<String, Object>map){
		return dao.list(map);
	}
	
	public int count() {
		return dao.count();
	}
	
	public ArchiveVO detail(int room_num){
		return dao.detail(room_num);
	}
	
	public int hit(int room_num) {
		return dao.hit(room_num);
	}
	
	public ArchiveVO next(int room_num){
		return dao.next(room_num);
	}
	
	public ArchiveVO prev(int room_num) {
		return dao.prev(room_num);
	}
	
}
