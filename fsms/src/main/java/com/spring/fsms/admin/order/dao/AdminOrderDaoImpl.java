package com.spring.fsms.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOrderDaoImpl implements AdminOrderDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectGetOrderList() throws Exception {
		return sqlSession.selectList("adminOrder.selectListOrder");
	}
	
}
