package com.spring.fsms.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.goods.dto.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsDto> selectGoodsList(Map<String, String> goodsList) throws Exception {
		return sqlSession.selectList("goodsMapper.selectListGoods", goodsList);
	}

	@Override
	public GoodsDto selectGetOneGoods(int goodsCd) throws Exception {
		return sqlSession.selectOne("goodsMapper.selectGetOneGoods" , goodsCd);
	}
	
}
