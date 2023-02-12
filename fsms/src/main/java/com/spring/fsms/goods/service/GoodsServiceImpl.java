package com.spring.fsms.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.goods.dao.GoodsDao;
import com.spring.fsms.goods.dto.GoodsDto;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;

	@Override
	public List<GoodsDto> getGoodsList(Map<String, Object> searchInfo) throws Exception {
		return goodsDao.selectGoodsList(searchInfo);
	}

	@Override
	public GoodsDto getOneGoods(int goodsCd) throws Exception {
		return goodsDao.selectGetOneGoods(goodsCd);
	}

	@Override
	public List<GoodsDto> getSearchGoods(Map<String, Object> searchMap) throws Exception {
		return goodsDao.selectSearchGoods(searchMap);
	}

	@Override
	public int getTotalGoodsCount(Map<String, String> searchCountInfo) throws Exception {
		return goodsDao.selectGoodsCount(searchCountInfo);
	}

	
}
