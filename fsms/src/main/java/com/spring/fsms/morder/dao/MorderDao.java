package com.spring.fsms.morder.dao;

import java.util.List;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;

public interface MorderDao {
	
	public MemberDto selectOneGetOrder(String memberId) throws Exception;
	public List<GoodsDto> selectListGetGoodsByCart (int[] goodsCdList) throws Exception;

}
