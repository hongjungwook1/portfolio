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
	public void insertGoods(GoodsDto goodsDto)throws Exception {
		sqlSession.insert("adminGoodsMapper.insertGoods" , goodsDto);
	}

	@Override
	public void updateGoods(GoodsDto goodsDto)throws Exception {
		sqlSession.update("adminGoodsMapper.updateGoods" , goodsDto);
	}

	@Override
	public List<GoodsDto> selectGetGoodsList() throws Exception{
		return sqlSession.selectList("adminGoodsMapper.selectGoodsList");
	}

	@Override
	public GoodsDto selectGetOneGoods(int goodsCd) throws Exception{
		return sqlSession.selectOne("adminGoodsMapper.selectGetOneGoods" , goodsCd);
	}

	@Override
	public void deleteGoods(GoodsDto goodsDto) throws Exception {
		sqlSession.delete("adminGoodsMapper.deleteGoods" , goodsDto);
	}

}
