package com.spring.fsms.admin.member.dao;

import java.util.List;

import com.spring.fsms.admin.member.dto.AdminDto;
import com.spring.fsms.member.dto.MemberDto;

public interface AdminMemberDao {

	public AdminDto selectAdmin(AdminDto adminDto) throws Exception;
	public List<MemberDto> selectListMember() throws Exception;
	public MemberDto selectOneMemberList(String memberId) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	
}
