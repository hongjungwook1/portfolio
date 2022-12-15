package com.spring.fsms.admin.member.dao;

import com.spring.fsms.admin.member.dto.AdminDto;

public interface AdminMemberDao {

	public AdminDto selectAdmin(AdminDto adminDto) throws Exception;
	
}
