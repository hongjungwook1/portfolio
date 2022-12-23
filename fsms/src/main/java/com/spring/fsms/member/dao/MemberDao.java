package com.spring.fsms.member.dao;

import com.spring.fsms.member.dto.MemberDto;

public interface MemberDao {
	
	public void insertMember(MemberDto memberDto) throws Exception;
	public MemberDto loginMember(MemberDto memberDto) throws Exception;
	public String selectDuplicatedId(String memberId) throws Exception;
	public MemberDto selectGetOneMember(String memberId) throws Exception;
	public String selectOneValidateUserCheck(String memberId) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
}
