package com.spring.fsms.admin.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.admin.cart.service.AdminCartService;

@Controller
@RequestMapping("/admin")
public class AdminCartController {
	
	@Autowired
	private AdminCartService adminCartService;
	
	@RequestMapping(value="/cartList" , method=RequestMethod.GET)
	public ModelAndView adminCartList () throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/cart/cartList");
		mv.addObject("cartList", adminCartService.getCartList());
		return mv;
	}
	

}
