package com.spring.fsms.morder.service;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;

public interface MorderService {

	public MemberDto getOrderDetail (String memberId) throws Exception;
	public void addOrder (Map<String, String> goodsList) throws Exception;
	public List<GoodsDto> getGoodsListByCart(int [] cartCdList) throws Exception;
	public void addOrderByCart(Map<String,String> orderListMap) throws Exception;
	
}
