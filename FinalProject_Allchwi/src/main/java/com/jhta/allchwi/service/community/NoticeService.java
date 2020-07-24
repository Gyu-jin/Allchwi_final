package com.jhta.allchwi.service.community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.allchwi.dao.community.NoticeDAO;
import com.jhta.allchwi.vo.community.NoticeVO;

@Service
public class NoticeService {
	@Autowired 
	private NoticeDAO ntd;
	
	//공지글 작성
		public int writeNotice(NoticeVO ntv) {
			return ntd.writeNotice(ntv);
		}
		//커뮤니티 관리자 확인(세션 회원 번호, 세션 튜터 번호)
		public int adminCheck(HashMap<String, Object> map) {
			return ntd.adminCheck(map);
		}
		//공지사항 목록 출력
		public List<NoticeVO> noticeList(HashMap<String, Object> map){
			return ntd.noticeList(map);
		}
		//공지사항 글 갯수
		public int count(HashMap<String, Object> map) {
			return ntd.count(map);
		}
		//조회수 증가 후 상세 페이지 출력
		@Transactional
		public NoticeVO getDetail(int notice_num) throws Exception{
			ntd.hit(notice_num);
			return ntd.getDetail(notice_num);
		}
		//조회수 증가시키기 
		public int hit(int notice_num) {
			return ntd.hit(notice_num);
		}
}
