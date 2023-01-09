package com.spring.fsms.morder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;
import com.spring.fsms.morder.dto.MorderDto;

@Repository
public class MorderDaoImpl implements MorderDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto selectOneGetOrder(String memberId) throws Exception {
		return sqlSession.selectOne("MorderMapper.selectOneGetOrder" , memberId);
	}

	@Override
	public List<GoodsDto> selectListGetGoodsByCart(int[] cartCdList) throws Exception {
		return sqlSession.selectList("MorderMapper.selectListGetGoodsByCart" , cartCdList);
	}

	@Override
	public void insertOrderByCart(List<MorderDto> orderList) throws Exception {
		sqlSession.insert("MorderMapper.insertOrderByCart" , orderList);
	}

	@Override
	public void deleteCartByOrder(int[] cartCdList) throws Exception {
		sqlSession.delete("MorderMapper.deleteCartByOrder" , cartCdList);
	}

	@Override
	public void insertOrderGoods(Map<String, String> goodsList) throws Exception {
		sqlSession.insert("MorderMapper.insertOrderGoods" , goodsList);
	}
	
	
	
	
	
	
	
	
	
	
	
}
