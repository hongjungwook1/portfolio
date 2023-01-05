package com.spring.fsms.morder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;

@Repository
public class MorderDaoImpl implements MorderDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto selectOneGetOrder(String memberId) throws Exception {
		return sqlSession.selectOne("MorderMapper.selectOneGetOrder" , memberId);
	}

	@Override
	public List<GoodsDto> selectListGetGoodsByCart(int[] goodsCdList) throws Exception {
		return sqlSession.selectList("MorderMapper.selectListGetGoodsByCart" , goodsCdList);
	}
	
	
	
	
	
	
	
	
	
	
	
}
