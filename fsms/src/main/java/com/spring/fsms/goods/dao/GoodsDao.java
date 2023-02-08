package com.spring.fsms.goods.dao;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;

public interface GoodsDao {

	public List<GoodsDto> selectGoodsList (Map<String,Object> goodsList) throws Exception;
	public GoodsDto selectGetOneGoods(int goodsCd) throws Exception;
	public int selectGetGoodsCnt() throws Exception;
	public List<GoodsDto> selectSearchGoods (Map<String,Object> searchMap) throws Exception;
	
}
