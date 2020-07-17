package com.jhta.allchwi.service.classdetail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.classdetail.ClassReviewDAO;
import com.jhta.allchwi.vo.classdetail.ClassReviewVO;
@Service
public class ClassReviewService {
@Autowired private ClassReviewDAO dao;
	public int insertReview(ClassReviewVO vo) {
		return dao.insertReview(vo);
	}
	public List<ClassReviewVO> reviewList(int class_num) {
		return dao.reviewList(class_num);
	}
}
