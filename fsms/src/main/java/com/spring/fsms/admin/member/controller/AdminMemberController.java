package com.spring.fsms.admin.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.admin.member.dto.AdminDto;
import com.spring.fsms.admin.member.service.AdminMemberService;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/fsms/login" , method=RequestMethod.GET)
	public ModelAndView adminLogin() throws Exception {
		return new ModelAndView("/admin/adminLogin");
	}
	
	@RequestMapping(value="/fsms/login" , method=RequestMethod.POST)
	public ModelAndView adminLogin(AdminDto adminDto) throws Exception {
		return new ModelAndView("/admin/adminMain");
	}
	
	
	
	
	
	
}
