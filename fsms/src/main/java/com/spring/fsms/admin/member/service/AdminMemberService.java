package com.spring.fsms.admin.member.service;

import com.spring.fsms.admin.member.dto.AdminDto;

public interface AdminMemberService {
	
	public boolean adminLogin(AdminDto adminDto) throws Exception;
}
