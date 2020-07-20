package com.jhta.allchwi.dao.wishlist;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.allchwi.vo.wishlist.WishListJoinVO;
import com.jhta.allchwi.vo.wishlist.WishListVO;
@Repository
public class WishListDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.jhta.mybatis.mapper.WishListMapper";	
	public int insertWish(WishListVO vo) {
		return session.insert(NAMESPACE+".insertWish", vo);
	}
	public int deleteWish(WishListVO vo) {
		return session.delete(NAMESPACE+".deleteWish", vo);
	}
	public WishListVO getWish(int ml_num) {
		return session.selectOne(NAMESPACE+".getWish", ml_num);
	}
	public List<WishListJoinVO> getWishList(HashMap<String, Object> map) {
		return session.selectList(NAMESPACE + ".myWishList", map);
	}
	public int count(int ml_num) {
		return session.selectOne(NAMESPACE+".count",ml_num);
	}
}
