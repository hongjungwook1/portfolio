package com.spring.fsms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDaoImpl implements CommonDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectOneGetBeefCnt() throws Exception {
		return sqlSession.selectOne("commonMapper.selectOneGetBeefCnt");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsMain() throws Exception {
		return sqlSession.selectList("commonMapper.selectListGoodsMain");
	}

	@Override
	public List<Map<String, Object>> selectListLatestGoods() throws Exception {
		return sqlSession.selectList("commonMapper.selectListLatestGoods");
	}

	@Override
	public List<Map<String, Object>> selectListTopPriceGoods() throws Exception {
		return sqlSession.selectList("commonMapper.selectListTopPriceGoods");
	}

	@Override
	public List<Map<String, Object>> selectListLowestPriceGoods() throws Exception {
		return sqlSession.selectList("commonMapper.selectListLowestPriceGoods");
	}
	
}
