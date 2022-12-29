package com.spring.fsms.cart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertCart(CartDao cartDao) throws Exception {
		sqlSession.insert("cartMapper.insertCart" , cartDao);
	}
}
