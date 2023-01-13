package com.spring.fsms.member.service;

import java.util.List;
import java.util.Map;

import com.spring.fsms.member.dto.MemberDto;

public interface MemberService {
	
	public void addMember(MemberDto memberDto) throws Exception;
	public boolean loginMember(MemberDto memberDto) throws Exception;
	public int checkDuplicatedId (String memberId) throws Exception;
	public MemberDto getOneMember (String memberId) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public List<Map<String,Object>> getMyOrderList(String memberId) throws Exception;
	public Map<String,Object> getMyOrderDetail(Map<String,Object> orderDetailMap) throws Exception;
	public int getMyCartCnt(String memberId) throws Exception;
	public int getMyOrderCnt(String memberId) throws Exception;
}
