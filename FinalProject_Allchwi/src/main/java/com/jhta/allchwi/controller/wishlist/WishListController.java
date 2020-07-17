package com.jhta.allchwi.controller.wishlist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.allchwi.service.classopen.ClassInfoService;
import com.jhta.allchwi.service.wishlist.WishListService;
import com.jhta.allchwi.vo.wishlist.WishListVO;

@Controller
public class WishListController {
	@Autowired
	private WishListService wl_service;
	@GetMapping("/class/wishList")
	public String goWishList() {
		return ".wishlist.wishList";
	}
	
	@PostMapping("/class/addWish")
	@ResponseBody
	public String addWish(WishListVO wvo) {
		try {
			wl_service.insertWish(wvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	@PostMapping("/class/removeWish")
	@ResponseBody
	public String removeWish(WishListVO wvo) {
		try {
			wl_service.deleteWish(wvo);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
}
