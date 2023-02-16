package com.spring.fsms.goods.dao;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;

public interface GoodsDao {

	public List<GoodsDto> selectGoodsList (Map<String,Object> searchInfo) throws Exception;
	public int selectGoodsCount(Map<String, String> searchCountInfo) throws Exception;
	public GoodsDto selectGetOneGoods(int goodsCd) throws Exception;
	public List<GoodsDto> selectSearchGoods (Map<String,Object> searchMap) throws Exception;
	public List<GoodsDto> selectGetGoodsCategory (Map<String,Object> goodsListMap) throws Exception;
	public int selectTotalGoodsCnt(String goodsCategory) throws Exception;
	
}
