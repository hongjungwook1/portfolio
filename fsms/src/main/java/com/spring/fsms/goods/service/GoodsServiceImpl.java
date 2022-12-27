package com.spring.fsms.goods.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.goods.dao.GoodsDao;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;
	
}
