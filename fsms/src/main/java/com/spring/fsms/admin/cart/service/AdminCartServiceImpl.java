package com.spring.fsms.admin.cart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.admin.cart.dao.AdminCartDao;

@Service
public class AdminCartServiceImpl implements AdminCartService {

	@Autowired
	private AdminCartDao adminCartDao;
}
