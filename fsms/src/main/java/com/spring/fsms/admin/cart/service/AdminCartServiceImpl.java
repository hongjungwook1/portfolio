package com.spring.fsms.admin.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.admin.cart.dao.AdminCartDao;
import com.spring.fsms.cart.dto.CartDto;

@Service
public class AdminCartServiceImpl implements AdminCartService {

	@Autowired
	private AdminCartDao adminCartDao;

	@Override
	public List<CartDto> getCartList() throws Exception {
		return adminCartDao.selectCartList();
	}
}
