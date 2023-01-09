package com.spring.fsms.morder.dao;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;
import com.spring.fsms.morder.dto.MorderDto;

public interface MorderDao {
	
	public MemberDto selectOneGetOrder(String memberId) throws Exception;
	public void insertOrderGoods(Map<String, String> goodsList) throws Exception;
	public List<GoodsDto> selectListGetGoodsByCart (int[] cartCdList) throws Exception;
	public void insertOrderByCart(List<MorderDto> orderList) throws Exception;
	public void deleteCartByOrder(int[] cartCdList) throws Exception;
}
