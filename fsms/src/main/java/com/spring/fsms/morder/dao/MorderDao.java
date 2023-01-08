package com.spring.fsms.morder.dao;

import java.util.List;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;
import com.spring.fsms.morder.dto.MorderDto;

public interface MorderDao {
	
	public MemberDto selectOneGetOrder(String memberId) throws Exception;
	public List<GoodsDto> selectListGetGoodsByCart (int[] goodsCdList) throws Exception;
	public void insertOrderByCart(List<MorderDto> orderList) throws Exception;
	public void deleteCartByOrder(int[] cartCdList) throws Exception;
}
