package com.spring.fsms.admin.goods.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminGoodsDaoImpl implements AdminGoodsDao {

	@Autowired
	private SqlSession sqlSession;
}
