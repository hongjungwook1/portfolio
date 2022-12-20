package com.spring.fsms.member.service;

import com.spring.fsms.member.dto.MemberDto;

public interface MemberService {
	
	public void addMember(MemberDto memberDto) throws Exception;
	public boolean loginMember(MemberDto memberDto) throws Exception;

}
