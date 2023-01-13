package com.spring.fsms.member.dao;

import java.util.List;
import java.util.Map;

import com.spring.fsms.member.dto.MemberDto;

public interface MemberDao {
	
	public void insertMember(MemberDto memberDto) throws Exception;
	public MemberDto loginMember(MemberDto memberDto) throws Exception;
	public int selectDuplicatedId(String memberId) throws Exception;
	public MemberDto selectGetOneMember(String memberId) throws Exception;
	public String selectOneValidateUserCheck(String memberId) throws Exception;
	public void updateMember(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	public List<Map<String, Object>> selectListMyOrder (String memberId) throws Exception;
	public Map<String, Object> selectOneGetMyOrder (Map<String, Object> orderDetailMap) throws Exception;
	public int selectOneGetMyCartCnt(String memberId) throws Exception;
	public int selectOneGetMyOrderCnt(String memberId) throws Exception;
	 
}
