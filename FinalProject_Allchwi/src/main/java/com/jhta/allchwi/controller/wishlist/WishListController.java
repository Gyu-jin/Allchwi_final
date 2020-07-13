package com.jhta.allchwi.controller.wishlist;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WishListController {
	
	@GetMapping("/class/wishList")
	public String goWishList() {
		
		return ".wishlist.wishList";
	}
}
