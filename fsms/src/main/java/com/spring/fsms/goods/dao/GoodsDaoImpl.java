package com.spring.fsms.goods.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSession sqlSession;
	
}
