package com.spring.fsms.morder.controller;

import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.morder.service.MorderService;

@Controller
@RequestMapping("/morder")
public class MorderController {

	@Autowired
	private MorderService mOrderService;
	
	@RequestMapping(value="/orderMain" , method=RequestMethod.GET)
	public ModelAndView orderMain() {
		return null;
		
	}
	
	@RequestMapping(value="/mOrderCartGoods" , method=RequestMethod.GET)
	public ModelAndView mOrderCartGoods (@RequestParam("goodsCdList") String goodsCds ,
										@RequestParam("cartGoodsQtyList") String cartGoodsQtyList ,
										@RequestParam("cartCdList") String cartCds , 
										HttpServletRequest request) throws Exception {
		
		
		String [] temp = cartCds.split(",");
		int[] cartCdList = new int [temp.length];
		
		for (int i = 0; i < cartCdList.length; i++) {
			cartCdList[i] = Integer.parseInt(temp[i]);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/client/order/orderCartGoods");
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		List<GoodsDto> temp2 = mOrderService.getGoodsListByCart(cartCdList);
		for (int i = 0; i < cartCdList.length; i++) {
			System.out.println(temp2);
		}
		
				
		
		mv.addObject("orderer", mOrderService.getOrderDetail(memberId));
		mv.addObject("goodsList", mOrderService.getGoodsListByCart(cartCdList));
		mv.addObject("orderGoodsQtyList", cartGoodsQtyList);
		mv.addObject("goodsCdList", goodsCds);
		mv.addObject("cartCdList", cartCds);
		
		
		return mv;
	}
	
	@RequestMapping(value="/orderCartGoods" , method=RequestMethod.POST)
	public ResponseEntity<Object> orderCartGoods (@RequestParam Map<String,String> orderListMap , HttpServletRequest request) throws Exception {
		
		System.out.println(orderListMap);
		mOrderService.addOrderByCart(orderListMap);
		
		String jsScript = "";
		
		jsScript = "<script>";
		jsScript += "alert('상품을 주문하였습니다.');";
	    jsScript += "location.href='" + request.getContextPath() + "/'";
	    jsScript +="</script>";
		
		
		
		 HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
	    return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
		
	}
	
	
	
}
