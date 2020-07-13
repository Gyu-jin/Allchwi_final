package com.jhta.allchwi.controller.wishlist;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WishListController {
	
	@GetMapping("/class/wishList")
	public String goWishList() {
		return ".wishlist.wishList";
	}
	
	@PostMapping("/class/addWish")
	@ResponseBody
	public String addWish() {
		return "success";
	}
	
	@PostMapping("/class/removeWish")
	@ResponseBody
	public String removeWish() {
		return "success";
	}
}
