package com.spring.fsms.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.common.service.CommonService;
import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.goods.service.GoodsService;


@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CommonService commonService;
	
	
	@RequestMapping(value="/goodsList" , method=RequestMethod.GET)
	public ModelAndView goodsList(@RequestParam Map<String,Object> goodsListMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsList");
		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		mv.addObject("goodsCnt", goodsService.getGoodCnt());
		mv.addObject("latestList", commonService.getlatestGoodsInfo());
		
		return mv;
	}
	
	@RequestMapping(value="/goodsDetails" , method=RequestMethod.GET)
	public ModelAndView goodsDetails(@RequestParam("goodsCd") int goodsCd) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsDetails");
		mv.addObject("goodsDto", goodsService.getOneGoods(goodsCd));
		return mv;
	}
	
	@RequestMapping(value="/searchGoods" , method=RequestMethod.GET)
	public ModelAndView goodsDetails (@RequestParam Map<String,Object> searchMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsList");
		mv.addObject("goodsList", goodsService.getSearchGoods(searchMap));
		mv.addObject("latestList", commonService.getlatestGoodsInfo());
		
		return mv;
	}
	
	
	
	
}
