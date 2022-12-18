package com.spring.fsms.admin.goods.service;

import java.util.List;

import com.spring.fsms.goods.dto.GoodsDto;

public interface AdminGoodsService {
	

	public void addGoods(GoodsDto goodsDto);
	public void modifyGoods(GoodsDto goodsDto);
	public List<GoodsDto> getGoodsList();
	public GoodsDto getOneGoods(int goodsCd);
}
