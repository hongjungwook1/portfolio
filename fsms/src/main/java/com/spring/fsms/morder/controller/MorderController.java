package com.spring.fsms.morder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;
import com.spring.fsms.member.service.MemberService;
import com.spring.fsms.morder.service.MorderService;

@Controller
@RequestMapping("/morder")
public class MorderController {

	@Autowired
	private MorderService mOrderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/orderMain" , method=RequestMethod.GET)
	public ModelAndView orderMain() {
		return null;
		
	}
	
	@RequestMapping(value="/mOrderCartGoods" , method=RequestMethod.GET)
	public ModelAndView mOrderCartGoods (@RequestParam("goodsCdList") String goodsCds ,
										@RequestParam("cartGoodsQtyList") String cartGoodsQtyList ,
										@RequestParam("cartCdList") String cartCdList , 
										HttpServletRequest request) throws Exception {
		
		String [] temp = goodsCds.split(",");
		int[] goodsCdList = new int [temp.length];
		
		for (int i = 0; i < goodsCdList.length; i++) {
			goodsCdList[i] = Integer.parseInt(temp[i]);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/client/order/orderCartGoods");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		mv.addObject("orderer", mOrderService.getOrderDetail(memberId));
		mv.addObject("goodsList", mOrderService.getGoodsListByCart(goodsCdList));
		mv.addObject("orderGoodsQtyList", cartGoodsQtyList);
		mv.addObject("goodsCdList", goodsCds);
		mv.addObject("cartCdList", cartCdList);
		
		
		
		
		return mv;
	}
	
	
	
}
