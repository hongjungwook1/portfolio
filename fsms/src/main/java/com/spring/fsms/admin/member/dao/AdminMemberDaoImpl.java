package com.spring.fsms.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.admin.member.dto.AdminDto;
import com.spring.fsms.member.dto.MemberDto;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public AdminDto selectAdmin(AdminDto adminDto) throws Exception {
		return sqlsession.selectOne("adminMember.selectAdminLogin" , adminDto);
	}

	@Override
	public List<MemberDto> selectListMember() throws Exception {
		return sqlsession.selectList("adminMember.selectListMember");
	}

	@Override
	public MemberDto selectOneMemberList(String memberId) throws Exception {
		return sqlsession.selectOne("adminMember.selectOneMemberList" , memberId);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlsession.delete("adminMember.deleteMember" , memberId);
	}

}
