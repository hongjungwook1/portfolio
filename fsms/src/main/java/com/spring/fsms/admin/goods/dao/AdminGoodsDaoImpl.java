package com.spring.fsms.admin.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.goods.dto.GoodsDto;

@Repository
public class AdminGoodsDaoImpl implements AdminGoodsDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGoods(GoodsDto goodsDto) {
		sqlSession.insert("adminGoodsMapper.insertGoods" , goodsDto);
	}

	@Override
	public void updateGoods(GoodsDto goodsDto) {
		sqlSession.update("adminGoodsMapper.updateGoods" , goodsDto);
	}

	@Override
	public List<GoodsDto> selectGetGoodsList() {
		return sqlSession.selectList("adminGoodsMapper.selectGoodsList");
	}

	@Override
	public GoodsDto selectGetOneGoods(int goodsCd) {
		return sqlSession.selectOne("adminGoodsMapper.selectGetOneGoods" , goodsCd);
	}

}
