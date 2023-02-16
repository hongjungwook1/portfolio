package com.spring.fsms.goods.service;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;

public interface GoodsService {
	
	public List<GoodsDto> getGoodsList(Map<String,Object> searchInfo) throws Exception;
	public int getTotalGoodsCount(Map<String, String> searchCountInfo) throws Exception;
	public GoodsDto getOneGoods(int goodsCd) throws Exception;
	public List<GoodsDto> getSearchGoods(Map<String,Object> searchMap) throws Exception;
	public List<GoodsDto> getGoodsCategoryList (Map<String, Object> goodsListMap) throws Exception;
	public int getTotalGoodsCnt(String goodsCategory) throws Exception;
	
}
