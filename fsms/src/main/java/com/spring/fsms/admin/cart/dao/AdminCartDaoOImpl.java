package com.spring.fsms.admin.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.cart.dto.CartDto;

@Repository
public class AdminCartDaoOImpl implements AdminCartDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CartDto> selectCartList() throws Exception {
		return sqlSession.selectList("adminCartMapper.selectCartList");
	}
	

}
