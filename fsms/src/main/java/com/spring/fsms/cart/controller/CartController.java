package com.spring.fsms.cart.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.cart.dto.CartDto;
import com.spring.fsms.cart.service.CartService;
import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.service.MemberService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/myCartList" , method=RequestMethod.GET)
	public ModelAndView myCartList(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();
		
		String memberId = (String)session.getAttribute("memberId");
		mv.setViewName("/client/cart/myCartList");
		mv.addObject("myCartList", cartService.getMyCartList(memberId));
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/addCart" , method=RequestMethod.GET)
	@ResponseBody
	public String addCart(@RequestParam("goodsCd") int goodsCd , @RequestParam("cartQty") int cartQty ,  HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		CartDto cartDto = new CartDto();
		cartDto.setMemberId(memberId);
		cartDto.setGoodsCd(goodsCd);
		cartDto.setCartQty(cartQty);
		
		String result = "duple";
		if (!cartService.checkDuplicatedCart(cartDto)) {
			cartService.addCart(cartDto);
			session.setAttribute("myCartCnt", cartService.getMyCartCnt(memberId));
			result = "notDuple";
		}
		
		return result;
		
	}
	
	
	@RequestMapping(value="/modifyCart" , method=RequestMethod.GET)
	public ResponseEntity<Object> modifyCart(@RequestParam Map<String,Object> updateMap) throws Exception {
		cartService.modifyCartQty(updateMap);
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
	
	
	
	@RequestMapping(value="/removeCart" , method=RequestMethod.GET)
	public ResponseEntity<Object> removeCart(@RequestParam("cartCd") String cartCdList , HttpServletRequest request) throws Exception {
		
		String[] temp = cartCdList.split(",");
		int[] deleteCartCdList = new int[temp.length];
		
		for (int i = 0; i < temp.length; i++) {
			deleteCartCdList[i] = Integer.parseInt(temp[i]);
		}
		
		cartService.removeCart(deleteCartCdList);
		
		HttpSession session = request.getSession();
		
		String  jsScript = "<script>";
				jsScript += "alert('장바구니 품목이 삭제되었습니다.'); ";
				jsScript += "location.href='myCartList'";
				jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	
	
	
	
}
