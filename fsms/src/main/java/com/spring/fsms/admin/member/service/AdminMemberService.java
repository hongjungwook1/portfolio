package com.spring.fsms.admin.member.service;

import java.util.List;

import com.spring.fsms.admin.member.dto.AdminDto;
import com.spring.fsms.member.dto.MemberDto;

public interface AdminMemberService {
	
	public boolean adminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> getMemberList() throws Exception;
	public MemberDto getOneMemberList(String memberId) throws Exception;
	public void removeMember(String memberId) throws Exception;
	
}
