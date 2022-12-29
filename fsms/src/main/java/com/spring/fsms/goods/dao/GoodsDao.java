package com.spring.fsms.goods.dao;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;

public interface GoodsDao {

	public List<GoodsDto> selectGoodsList (Map<String,String> goodsList) throws Exception;
	public GoodsDto selectGetOneGoods(int goodsCd) throws Exception;
	
}
