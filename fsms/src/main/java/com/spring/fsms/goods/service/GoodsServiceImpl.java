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
	public List<GoodsDto> getGoodsList(Map<String, String> goodsList) throws Exception {
		return goodsDao.selectGoodsList(goodsList);
	}

	@Override
	public GoodsDto getOneGoods(int goodsCd) throws Exception {
		return goodsDao.selectGetOneGoods(goodsCd);
	}

	@Override
	public int getGoodCnt() throws Exception {
		return goodsDao.selectGetGoodsCnt();
	}

	@Override
	public List<GoodsDto> getSearchGoods(Map<String, Object> searchMap) throws Exception {
		return goodsDao.selectSearchGoods(searchMap);
	}

	@Override
	public int getTotalViewCount(Map<String, Object> searchMap) throws Exception {
		return goodsDao.selectViewCnt(searchMap);
	}

	
}
