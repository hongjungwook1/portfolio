package com.spring.fsms.admin.goods.service;

import java.util.List;

import com.spring.fsms.goods.dto.GoodsDto;

public interface AdminGoodsService {
	
	public void addGoods(GoodsDto goodsDto) throws Exception;
	public void modifyGoods(GoodsDto goodsDto)throws Exception ;
	public List<GoodsDto> getGoodsList() throws Exception;
	public GoodsDto getOneGoods(int goodsCd) throws Exception;
	public void deleteGoods(GoodsDto goodsDto) throws Exception;
	
	// view  controller   serivce   dao    mapper
	//  !                                     !
	
	
}
