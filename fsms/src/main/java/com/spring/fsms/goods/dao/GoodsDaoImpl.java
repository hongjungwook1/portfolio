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
	public List<GoodsDto> selectGoodsList(Map<String, Object> searchInfo) throws Exception {
		return sqlSession.selectList("goodsMapper.selectListGoods", searchInfo);
	}

	@Override
	public GoodsDto selectGetOneGoods(int goodsCd) throws Exception {
		return sqlSession.selectOne("goodsMapper.selectGetOneGoods" , goodsCd);
	}

	@Override
	public List<GoodsDto> selectSearchGoods(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("goodsMapper.selectGetSearchGoods" , searchMap);
	}

	@Override
	public int selectGoodsCount(Map<String, String> searchCountInfo) throws Exception {
		return sqlSession.selectOne("goodsMapper.selectGoodsCount" , searchCountInfo);
	}

	@Override
	public List<GoodsDto> selectGetGoodsCategory(Map<String, Object> goodsListMap) throws Exception {
		return sqlSession.selectList("goodsMapper.selectGetGoodsCategory" , goodsListMap);
	}

	@Override
	public int selectTotalGoodsCnt(String goodsCategory) throws Exception {
		return sqlSession.selectOne("goodsMapper.selectTotalGoodsCnt" ,goodsCategory);
	}

}
