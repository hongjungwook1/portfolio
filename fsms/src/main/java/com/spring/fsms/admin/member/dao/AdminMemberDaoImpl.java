package com.spring.fsms.admin.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.fsms.admin.member.dto.AdminDto;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {

	private SqlSession sqlsession;

	@Override
	public AdminDto selectAdmin(AdminDto adminDto) throws Exception {
		return sqlsession.selectOne("adminMember.selectAdminLogin" , adminDto);
	}

}
