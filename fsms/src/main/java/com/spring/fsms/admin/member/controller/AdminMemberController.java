package com.spring.fsms.admin.member.controller;

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

import com.spring.fsms.admin.member.dto.AdminDto;
import com.spring.fsms.admin.member.service.AdminMemberService;
import com.spring.fsms.member.dto.MemberDto;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private MemberDto memberDto;
	
	@RequestMapping(value="/adminMain" , method=RequestMethod.GET)
	public ModelAndView adminMain () {
		return new ModelAndView("/admin/adminMain");
	}
	
	
	@RequestMapping(value="/fsms/login" , method=RequestMethod.GET)
	public ModelAndView adminLogin() throws Exception {
		return new ModelAndView("/admin/adminLogin");
	}
	
	@RequestMapping(value="/fsms/login" , method=RequestMethod.POST)
	public ResponseEntity<Object> adminLogin(AdminDto adminDto , HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		
		if (adminMemberService.adminLogin(adminDto)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminDto.getAdminId());
			session.setAttribute("role", "admin");
			
			jsScript += "<script>";
			jsScript += "alert('관리자가 로그인 하였습니다.');";
			jsScript += "location.href='" + request.getContextPath() + "/admin/adminMain'";
			jsScript += "</script>";
		}
		else {
			
			jsScript += "<script>";
			jsScript += "alert('관리자 아이디 , 비밀번호 확인해주세요.');";
			jsScript += "history.go(-1);";
			jsScript += "</script>";
		}
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/memberList" , method=RequestMethod.GET)
	public ModelAndView memberList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/member/memberList");
		mv.addObject("memberList", adminMemberService.getMemberList());
		return mv;
	}
	
	@RequestMapping(value="/memberInfo" , method=RequestMethod.GET)
	public ModelAndView memberInfo (@RequestParam("memberId") String memberId) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/member/memberInfo");
		mv.addObject("memberDto", adminMemberService.getOneMemberList(memberId));
		
		return mv;
	}
	
	@RequestMapping(value="/memberDelete" , method=RequestMethod.GET)
	public ModelAndView memberDelete() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/member/memberDelete");
		mv.addObject("memberDto");
		return mv;
		
	}
	
	@RequestMapping(value="/memberDelete" , method=RequestMethod.POST)
	public ResponseEntity<Object> memberDelete(@RequestParam("memberId") String memberId , HttpServletRequest request) throws Exception {

		adminMemberService.removeMember(memberId);
		
		String jsScript ="";
		
		jsScript += "<script>";
		jsScript += "alert('회원을 삭제하였습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/admin/adminMain'";
		jsScript += "</script>";
	
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
		
	}
	
	
}
