package com.spring.fsms.morder.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MorderDaoImpl implements MorderDao{

	@Autowired
	private SqlSession sqlSession;
}
