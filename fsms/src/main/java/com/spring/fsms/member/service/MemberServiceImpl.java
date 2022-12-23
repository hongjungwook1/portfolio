package com.spring.fsms.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.fsms.member.dao.MemberDao;
import com.spring.fsms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void addMember(MemberDto memberDto) throws Exception {
		memberDao.insertMember(memberDto);
	}

	@Override
	public boolean loginMember(MemberDto memberDto) throws Exception {
		boolean isLogin = false;
		
		MemberDto checkExsistId = memberDao.loginMember(memberDto);
		if (checkExsistId != null) {
			if (bCryptPasswordEncoder.matches(memberDto.getPassword(), checkExsistId.getPassword())) {
				isLogin = true;
			}
		}
		
		return isLogin;
	}

	@Override
	public String checkDuplicatedId(String memberId) throws Exception {
		
		if (memberDao.selectDuplicatedId(memberId) == null) return "duplicate";
		else												return "notduplicate";
		
	}

	@Override
	public boolean modifyMember(String memberId) throws Exception {
		
		boolean isModdify = false;
		
		if (memberDao.selectOneValidateUserCheck(memberId) != null) {
			isModdify = true;
		}
		
		return isModdify;
	}

	@Override
	public MemberDto getOneMember(String memberId) throws Exception {
		return memberDao.selectGetOneMember(memberId);
		
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		memberDao.updateMember(memberDto);
	}


	
	
	
	
}
