package com.spring.fsms.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.cart.dao.CartDao;
import com.spring.fsms.cart.dto.CartDto;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao cartDao;

	@Override
	public void addCart(CartDto cartDto) throws Exception {
		cartDao.insertCart(cartDto);
	}

	@Override
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception {
		boolean isCheck = false;
		
		if (cartDao.selectOneDuplicatedCart(cartDto) != null) {
			isCheck = true;
		}
		
		return isCheck;
	}

	@Override
	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception {
		return cartDao.selectListMyCart(memberId);
	}
	
}
