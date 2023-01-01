package com.spring.fsms.cart.service;

import java.util.List;
import java.util.Map;

import com.spring.fsms.cart.dto.CartDto;

public interface CartService {
	
	public void addCart(CartDto cartDto) throws Exception;
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception;
	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception;
	public int getMyCartCnt (String memberId)throws Exception;
}
