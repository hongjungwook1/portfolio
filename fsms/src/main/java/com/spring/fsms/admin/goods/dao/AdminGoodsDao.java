package com.spring.fsms.admin.goods.dao;

import java.util.List;

import com.spring.fsms.goods.dto.GoodsDto;

public interface AdminGoodsDao {

	public void insertGoods(GoodsDto goodsDto)throws Exception;
	public void updateGoods(GoodsDto goodsDto)throws Exception;
	public List<GoodsDto> selectGetGoodsList()throws Exception;
	public GoodsDto selectGetOneGoods(int goodsCd)throws Exception;
	public void deleteGoods(GoodsDto goodsDto)throws Exception;
}
