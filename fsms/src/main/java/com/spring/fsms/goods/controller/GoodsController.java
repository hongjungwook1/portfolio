package com.spring.fsms.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.fsms.goods.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
}
