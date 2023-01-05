package com.spring.fsms.morder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;
import com.spring.fsms.morder.dao.MorderDao;

@Service
public class MorderServiceImpl implements MorderService {
	
	@Autowired
	private MorderDao mOrderDao;

	@Override
	public MemberDto getOrderDetail(String memberId)throws Exception {
		return mOrderDao.selectOneGetOrder(memberId);
	}

	@Override
	public List<GoodsDto> getGoodsListByCart(int[] goodsCdList) throws Exception {
		return mOrderDao.selectListGetGoodsByCart(goodsCdList);
	}
}
