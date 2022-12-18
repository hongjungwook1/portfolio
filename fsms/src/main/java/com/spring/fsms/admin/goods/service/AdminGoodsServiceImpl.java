package com.spring.fsms.admin.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.admin.goods.dao.AdminGoodsDao;
import com.spring.fsms.goods.dto.GoodsDto;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService {

	@Autowired
	private AdminGoodsDao adminGoodsDao;

	@Override
	public void addGoods(GoodsDto goodsDto) {
		adminGoodsDao.insertGoods(goodsDto);
	}

	@Override
	public void modifyGoods(GoodsDto goodsDto) {
		adminGoodsDao.updateGoods(goodsDto);
	}

	@Override
	public List<GoodsDto> getGoodsList() {
		return adminGoodsDao.selectGetGoodsList();
	}

	@Override
	public GoodsDto getOneGoods(int goodsCd) {
		return adminGoodsDao.selectGetOneGoods(goodsCd);
	}


}
