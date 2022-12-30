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
}
