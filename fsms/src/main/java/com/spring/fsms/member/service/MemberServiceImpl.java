package com.spring.fsms.member.service;

import java.util.List;
import java.util.Map;

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
	public int checkDuplicatedId(String memberId) throws Exception {
		int result = 0;
		
		result = memberDao.selectDuplicatedId(memberId);
		return result;
		
	}

	@Override
	public MemberDto getOneMember(String memberId) throws Exception {
		return memberDao.selectGetOneMember(memberId);
		
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		memberDao.updateMember(memberDto);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		memberDao.deleteMember(memberId);
	}

	@Override
	public List<Map<String, Object>> getMyOrderList(String memberId) throws Exception {
		return memberDao.selectListMyOrder(memberId);
	}

	@Override
	public Map<String, Object> getMyOrderDetail(Map<String, Object> orderDetailMap) throws Exception {
		return memberDao.selectOneGetMyOrder(orderDetailMap);
	}

	@Override
	public int getMyCartCnt(String memberId) throws Exception {
		return memberDao.selectOneGetMyCartCnt(memberId);
	}

	@Override
	public int getMyCartPrice(String memberId) throws Exception {
		return memberDao.selectOneGetMyCartPrice(memberId);
	}


	
	
	
	
}
