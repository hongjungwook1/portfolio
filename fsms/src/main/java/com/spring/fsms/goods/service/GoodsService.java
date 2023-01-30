package com.spring.fsms.goods.service;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;

public interface GoodsService {
	
	public List<GoodsDto> getGoodsList(Map<String,String> goodsList) throws Exception;
	public GoodsDto getOneGoods(int goodsCd) throws Exception;
	public int getGoodCnt() throws Exception;
	public List<GoodsDto> getSearchGoods(Map<String,Object> searchMap) throws Exception;
	
}
