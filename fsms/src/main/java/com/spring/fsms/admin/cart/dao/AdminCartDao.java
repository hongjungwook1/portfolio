package com.spring.fsms.admin.cart.dao;

import java.util.List;

import com.spring.fsms.cart.dto.CartDto;

public interface AdminCartDao {

	public List<CartDto> selectCartList() throws Exception;
	
}
