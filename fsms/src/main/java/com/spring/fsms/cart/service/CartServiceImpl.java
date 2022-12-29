package com.spring.fsms.cart.service;

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
		cartDao.insertCart(cartDao);
	}
	
}
