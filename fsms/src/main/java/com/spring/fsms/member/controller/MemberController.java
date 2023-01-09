package com.spring.fsms.member.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="/checkDuplicatedId" , method=RequestMethod.POST)
	@ResponseBody
	public String overlapped (@RequestParam("memberId") String memberId) throws Exception {
		
		String result = "N";
		
		int checkId = memberService.checkDuplicatedId(memberId);
		
		if (checkId == 1) {
			result = "Y";
		}
	
		return result;
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
			session.setAttribute("cartCnt", memberService.getMyCartCnt(memberDto.getMemberId()));
			session.setAttribute("orderCnt", memberService.getMyCartPrice(memberDto.getMemberId()));
			
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
	
	@RequestMapping(value="/update" , method=RequestMethod.GET)
	public ModelAndView update (@RequestParam("memberId") String memberId , HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.getAttribute(memberId);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/memberUpdate");
		mv.addObject("memberDto", memberService.getOneMember(memberId));
		return mv;
	}
	
	
	
	@RequestMapping(value="/update" , method=RequestMethod.POST)
	public ResponseEntity<Object> update(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		memberService.updateMember(memberDto);
		
		String jsScript = "";
				jsScript += "<script>";
				jsScript += " alert('개인 정보가 수정 되었습니다.');";
				jsScript += "location.href='" + request.getContextPath() + "/';";
				jsScript += " </script>";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=utf-8");
			
		return new ResponseEntity<Object>(jsScript, header, HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/delete" , method=RequestMethod.GET)
	public ModelAndView delete(@RequestParam("memberId") String memberId , HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.getAttribute(memberId);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/member/delete");
		mv.addObject("memberDto", memberService.getOneMember(memberId));
		
		return mv;
		
	}
	
	@RequestMapping(value="/delete" , method=RequestMethod.POST)
	public ResponseEntity<Object> deleteMember(@RequestParam("memberId") String memberId , HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		memberService.deleteMember(memberId);
		
		String jsScript = "";
		jsScript += "<script>";
		jsScript += " alert('탈퇴 되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/';";
		jsScript += " </script>";

		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=utf-8");
			
		return new ResponseEntity<Object>(jsScript, header, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/myOrderList" , method=RequestMethod.GET)
	public ModelAndView myOrderList (HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/client/myPage/myOrderList");
		mv.addObject("myOrderList", memberService.getMyOrderList(memberId));
		
		return mv;
	}
	
	@RequestMapping(value="/myOrderDetail" , method=RequestMethod.GET)
	public ModelAndView myOrderDetail (@RequestParam Map<String, Object> orderDetailMap) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/client/myPage/myOrderDetail");
		mv.addObject("myOrder", memberService.getMyOrderDetail(orderDetailMap));
		
		return mv;
		
	}
	
	
	
}
