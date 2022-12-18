package com.spring.fsms.admin.goods.dao;

import java.util.List;

import com.spring.fsms.goods.dto.GoodsDto;

public interface AdminGoodsDao {

	public void insertGoods(GoodsDto goodsDto);
	public void updateGoods(GoodsDto goodsDto);
	public List<GoodsDto> selectGetGoodsList();
	public GoodsDto selectGetOneGoods(int goodsCd);
}
