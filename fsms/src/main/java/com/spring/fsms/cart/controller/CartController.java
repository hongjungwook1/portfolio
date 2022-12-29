package com.spring.fsms.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.fsms.cart.dto.CartDto;
import com.spring.fsms.cart.service.CartService;
import com.spring.fsms.goods.dto.GoodsDto;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private GoodsDto goodsDto;
	
	
	@RequestMapping(value="/addCart" , method=RequestMethod.GET)
	@ResponseBody
	public String addCart(@RequestParam("goodsCd") int goodsCd , @RequestParam("cartQty") int cartQty ,  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		CartDto cartDto = new CartDto();
		cartDto.setMemberId(memberId);
		cartDto.setGoodsCd(goodsCd);
		cartDto.setCartQty(cartQty);
		
		
		
		return null;
		
	}
	
	
	
	
	
}
