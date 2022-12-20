package com.spring.fsms.member.dao;

import com.spring.fsms.member.dto.MemberDto;

public interface MemberDao {
	
	public void insertMember(MemberDto memberDto) throws Exception;
	public MemberDto loginMember(MemberDto memberDto) throws Exception;

}
