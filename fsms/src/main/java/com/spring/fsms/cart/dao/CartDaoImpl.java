package com.spring.fsms.cart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.cart.dto.CartDto;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertCart(CartDto cartDto) throws Exception {
		sqlSession.insert("cartMapper.insertCart" , cartDto);
	}

	@Override
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception {
		return sqlSession.selectOne("cartMapper.selectOneDuplicatedCart" , cartDto);
	}

	@Override
	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception {
		return sqlSession.selectList("cartMapper.selectListMyCart" , memberId);
	}

	@Override
	public int selectMyCartCnt(String memberId) throws Exception {
		return sqlSession.selectOne("cartMapper.selectMyCartCnt" , memberId);
	}

	@Override
	public void updateCartQty(Map<String, Object> updateMap) throws Exception {
		sqlSession.update("cartMapper.updateCartQty" , updateMap);
	}

	@Override
	public void deleteCart(int [] deleteCartCdList) throws Exception {
		sqlSession.delete("cartMapper.deleteCart" , deleteCartCdList);
	}
	
	
	
	
	
}
