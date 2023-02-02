package com.spring.fsms.admin.cart.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminCartDaoOImpl implements AdminCartDao {
	
	@Autowired
	private SqlSession sqlSession;
	

}
