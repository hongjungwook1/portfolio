package com.spring.fsms.admin.goods.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.admin.goods.dao.AdminGoodsDao;

@Service
public class AdminGoodsServiceImpl implements AdminGoodsService {

	@Autowired
	private AdminGoodsDao adminGoodsDao;
}
