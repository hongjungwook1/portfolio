package com.spring.fsms.morder.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.member.dto.MemberDto;
import com.spring.fsms.morder.dao.MorderDao;
import com.spring.fsms.morder.dto.MorderDto;

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
	
	@Override
	public void addOrderByCart(Map<String, String> orderListMap) throws Exception {
		
		List<MorderDto> orderList = new ArrayList<MorderDto>();
		
		String [] temp1 = orderListMap.get("goodsCdList").split(",");
		int [] goodsCdList = new int [temp1.length];
		for (int i = 0; i < temp1.length; i++) {
			goodsCdList[i] = Integer.parseInt(temp1[i]);
		}
		
		String[] temp2 = orderListMap.get("orderGoodsQtyList").split(",");
		int [] orderGoodsQtyList = new int[temp2.length];
		for (int i = 0; i < temp2.length; i++) {
			orderGoodsQtyList[i] = Integer.parseInt(temp2[i]);
		}
		
		for (int i = 0; i < goodsCdList.length; i++) {
			
			MorderDto mOrderDto = new MorderDto();
			
			mOrderDto.setGoodsCd(goodsCdList[i]);
			mOrderDto.setMemberId(orderListMap.get("memberId"));
			mOrderDto.setmOrderGoodsQty(orderGoodsQtyList[i]);
			mOrderDto.setmOrderName(orderListMap.get("mOrderName"));
			mOrderDto.setmOrderHp(orderListMap.get("mOrderHp"));
			mOrderDto.setmOrderReceiverName(orderListMap.get("mOrderReceiverName"));
			mOrderDto.setmOrderReceiverHp(orderListMap.get("mOrderReceiverHp"));
			mOrderDto.setmOrderDeliveryMethod(orderListMap.get("mOrderDeliveryMethod"));
			mOrderDto.setmOrderPayMethod(orderListMap.get("mOrderPayMethod"));
			mOrderDto.setmOrderPayOrdererHp(orderListMap.get("mOrderPayOrdererHp"));
			mOrderDto.setmOrderCardCompanyName(orderListMap.get("mOrderCardCompanyName"));
			mOrderDto.setmOrderCardPayMonth(orderListMap.get("mOrderCardPayMonth"));
			mOrderDto.setmOrderDeliveryMessage(orderListMap.get("mOrderDeliveryMessage"));
			mOrderDto.setmOrderDeliveryStatus(orderListMap.get("mOrderDeliveryStatus"));
			mOrderDto.setmOrderZipcode(orderListMap.get("mOrderZipcode"));
			mOrderDto.setmOrderRoadAddress(orderListMap.get("mOrderRoadAddress"));
			mOrderDto.setmOrderJibunAddress(orderListMap.get("mOrderJibunAddress"));
			mOrderDto.setmOrderNamujiAddress(orderListMap.get("mOrderNamujiAddress"));
			orderList.add(mOrderDto);
			
		}
		
		
		List<Map<String, Integer>> goodsMapList = new ArrayList<Map<String,Integer>>();
		
		for (int i = 0; i < goodsCdList.length; i++) {
			Map<String, Integer> goodsMap = new HashMap<String, Integer>();
			goodsMap.put("goodsCd", goodsCdList[i]);
			goodsMap.put("mOrderGoodsQty", orderGoodsQtyList[i]);
			goodsMapList.add(goodsMap);
		}
		
		mOrderDao.insertOrderByCart(orderList);
		
		String [] temp3 = orderListMap.get("cartCdList").split(",");
		int[]cartCdList = new int [temp3.length];
		for (int i = 0; i < temp3.length; i++) {
			cartCdList[i] = Integer.parseInt(temp3[i]);
		}
		
		mOrderDao.deleteCartByOrder(cartCdList);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
