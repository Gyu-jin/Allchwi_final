package com.jhta.allchwi.service.wishlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.allchwi.dao.wishlist.WishListDAO;
import com.jhta.allchwi.vo.wishlist.WishListVO;
@Service
public class WishListService {
@Autowired private WishListDAO dao;
	public int insertWish(WishListVO vo) {
		return dao.insertWish(vo);
	}
	public int deleteWish(WishListVO vo) {
		return dao.deleteWish(vo);
	}
	public WishListVO getWish(int ml_num) {
		return dao.getWish(ml_num);
	}
}
