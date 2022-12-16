package com.spring.fsms.admin.goods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.admin.goods.service.AdminGoodsService;
import com.spring.fsms.goods.dto.GoodsDto;

@Controller
public class AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Autowired
	private GoodsDto goodsDto;
	
	@RequestMapping(value="/insertGoods" , method=RequestMethod.GET)
	public ModelAndView insertGoods() {
		return new ModelAndView("/admin/insertGoods");
	}
	
	@RequestMapping(value="/insertGoods" , method=RequestMethod.POST)
	@ResponseBody
	public String insertGoods(GoodsDto goodsDto , HttpServletRequest request) {
		
		String jsScript = "";
		
		return jsScript;
		
	}
	
	
	
}
