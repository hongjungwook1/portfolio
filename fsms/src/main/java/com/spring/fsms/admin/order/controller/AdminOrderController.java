package com.spring.fsms.admin.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.admin.order.service.AdminOrderService;

@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

	@Autowired
	private AdminOrderService adminOrderService;
	
	@RequestMapping(value="/orderList" , method=RequestMethod.GET)
	public ModelAndView adminOrderList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/order/orderList");
		mv.addObject("orderList", adminOrderService.getOrderList());
		
		return mv;
	}
	
}
