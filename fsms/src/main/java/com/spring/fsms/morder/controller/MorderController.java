package com.spring.fsms.morder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.member.service.MemberService;
import com.spring.fsms.morder.service.MorderService;

@Controller
@RequestMapping("/morder")
public class MorderController {

	@Autowired
	private MorderService mOrderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/orderGoods" , method=RequestMethod.GET)
	public ModelAndView orderGoods() {
		return null;
		
	}
	
}
