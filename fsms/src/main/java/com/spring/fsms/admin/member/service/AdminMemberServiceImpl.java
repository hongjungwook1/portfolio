package com.spring.fsms.admin.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.admin.member.dao.AdminMemberDao;
import com.spring.fsms.admin.member.dto.AdminDto;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDao adminMemberDao;

	@Override
	public boolean adminLogin(AdminDto adminDto) throws Exception {
		boolean isLogin = false;
		
		if (adminMemberDao.selectAdmin(adminDto) != null) {
			isLogin = true;
		}
		
		return isLogin;
	}
}
