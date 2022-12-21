package com.spring.fsms.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.admin.member.dao.AdminMemberDao;
import com.spring.fsms.admin.member.dto.AdminDto;
import com.spring.fsms.member.dto.MemberDto;

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

	@Override
	public List<MemberDto> getMemberList() throws Exception {
		return adminMemberDao.selectListMember();
	}

	@Override
	public MemberDto getOneMemberList(String memberId) throws Exception {
		return adminMemberDao.selectOneMemberList(memberId);
	}

	@Override
	public void removeMember(String memberId) throws Exception {
		adminMemberDao.deleteMember(memberId);
	}


}
