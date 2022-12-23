package com.spring.fsms.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberDto memberDto) throws Exception {
		sqlSession.insert("memberMapper.insertMember" , memberDto);
	}

	@Override
	public MemberDto loginMember(MemberDto memberDto) throws Exception {
		return sqlSession.selectOne("memberMapper.loginMember" , memberDto);
	}

	@Override
	public String selectDuplicatedId(String memberId) throws Exception {
		return sqlSession.selectOne("memberMapper.selectDuplicatedId" , memberId);
	}

	@Override
	public String selectOneValidateUserCheck(String memberId) throws Exception {
		return sqlSession.selectOne("memberMapper.selectOneValidateUserCheck" ,memberId);
	}

	@Override
	public MemberDto selectGetOneMember(String memberId) throws Exception {
		return sqlSession.selectOne("memberMapper.selectGetOneMember" , memberId);
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		System.out.println(memberDto);
		sqlSession.update("memberMapper.updateMember" , memberDto);
	}



	
}
