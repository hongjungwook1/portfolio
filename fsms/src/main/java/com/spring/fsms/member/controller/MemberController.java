package com.spring.fsms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.member.dto.MemberDto;
import com.spring.fsms.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="/main" , method=RequestMethod.GET)
	public ModelAndView main () {
		return new ModelAndView("/member/main");
	}
	
	
	
	@RequestMapping(value="/join" , method=RequestMethod.GET)
	public ModelAndView join () throws Exception {
		return new ModelAndView("/client/join");
	}
	
	@RequestMapping(value="/join" , method=RequestMethod.POST)
	public ResponseEntity<Object> join (MemberDto memberDto , HttpServletRequest request) throws Exception{
		
		memberDto.setPassword(bCryptPasswordEncoder.encode(memberDto.getPassword()));
		
		memberService.addMember(memberDto);
		
		String jsScript = "";
		jsScript = "<script>";
		jsScript += "alert('회원 가입 되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";

		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
	}
	
	@RequestMapping(value="/checkDuplicatedId" , method=RequestMethod.GET)
	public ResponseEntity<String> overlapped (@RequestParam("memberId") String memberId) throws Exception {
		return new ResponseEntity<String>(memberService.checkDuplicatedId(memberId) , HttpStatus.OK);
	}
	
	@RequestMapping(value="login" , method=RequestMethod.GET)
	public ModelAndView login () throws Exception{
		return new ModelAndView("/client/login");
	}
	
	
	@RequestMapping(value="login" , method=RequestMethod.POST)
	public ResponseEntity<Object> login (MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		
		if (memberService.loginMember(memberDto)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberDto.getMemberId());
			session.setAttribute("role", "client");
			
			jsScript = "<script>";
			jsScript += "alert('로그인 되었습니다');";
			jsScript += "location.href='" + request.getContextPath() + "/member/main'";
			jsScript += "</script>";
			
		}
		else {
			
			jsScript = "<script>";
			jsScript += "alert('아이디 , 비밀번호 확인해주세요.');";
			jsScript += "history.go(-1)";
			jsScript += "</script>";
		}
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
	}
	
	@RequestMapping(value="/logout" , method=RequestMethod.GET)
	public ResponseEntity<Object> logout (HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		String jsScript = "<script>";
			   jsScript += " alert('로그아웃 되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += " </script>";
			   
	   HttpHeaders header = new HttpHeaders();
	   header.add("Content-Type", "text/html; charset=utf-8");
		
	   return new ResponseEntity<Object>(jsScript, header, HttpStatus.OK);
		
	}
	
	
	
	
	
	@RequestMapping(value="update" , method=RequestMethod.GET)
	public ModelAndView update () {
		return new ModelAndView("/member/memberUpdate");
	}
	
//	@RequestMapping(value="update" , method=RequestMethod.POST)
//	public ResponseEntity<Object> update (@RequestParam("memberId") String memberId , HttpServletRequest request) throws Exception {
//		
//		String jsScript = "";
//		
//		if (memberService.modifyMember(memberId)) {
//			
//			jsScript += "<script>";
//			jsScript += "alert('수정 되었습니다.');";
//			jsScript += "location.href='" + request.getContextPath() + "/member/main';";
//			jsScript += "</script>";
//			
//		}
//		else {
//			
//			jsScript += "<script>";
//			jsScript += "alert('아이디 , 비밀번호 확인바랍니다.');";
//			jsScript += "history.go(-1);";
//			jsScript += "</script>";
//		}
//		
//		HttpHeaders header = new HttpHeaders();
//		header.add("Content-Type", "text/html; charset=UTF-8");
//		
//		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
//	}
//	
//	
//	
	
}
