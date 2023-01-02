package com.spring.fsms.cart.dao;

import java.util.List;
import java.util.Map;

import com.spring.fsms.cart.dto.CartDto;

public interface CartDao {

	public void insertCart(CartDto cartDto) throws Exception;
	public CartDto selectOneDuplicatedCart (CartDto cartDto) throws Exception;
	public List<Map<String,Object>> selectListMyCart(String memberId) throws Exception;
	public int selectMyCartCnt (String memberId) throws Exception;
	public void updateCartQty(Map<String, Object> updateMap) throws Exception;
	public void deleteCart(int[] deleteCartCdList) throws Exception;
	
}
