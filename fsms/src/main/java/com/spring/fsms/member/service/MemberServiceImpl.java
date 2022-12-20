package com.spring.fsms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.member.dao.MemberDao;
import com.spring.fsms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public void addMember(MemberDto memberDto) throws Exception {
		memberDao.insertMember(memberDto);
	}

	@Override
	public boolean loginMember(MemberDto memberDto) throws Exception {
		boolean isLogin = false;
		
		if (memberDao.loginMember(memberDto) != null) {
			isLogin = true;
		}
		
		
		return isLogin;
	}
}
