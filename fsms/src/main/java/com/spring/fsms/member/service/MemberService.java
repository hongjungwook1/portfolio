package com.spring.fsms.member.service;

import com.spring.fsms.member.dto.MemberDto;

public interface MemberService {
	
	public void addMember(MemberDto memberDto) throws Exception;
	public boolean loginMember(MemberDto memberDto) throws Exception;
	public int checkDuplicatedId (String memberId) throws Exception;
	public MemberDto getOneMember (String memberId) throws Exception;
	public boolean modifyMember(String memberId) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
}
