package com.spring.fsms.goods.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.goods.dto.GoodsDto;
import com.spring.fsms.goods.service.GoodsService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	
	@RequestMapping(value="/goodsList" , method=RequestMethod.GET)
	public ModelAndView goodsList(@RequestParam Map<String,String> goodsListMap) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsList");
		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		mv.addObject("goodsCnt", goodsService.getGoodCnt());
		return mv;
	}
	
	@RequestMapping(value="/goodsDetails" , method=RequestMethod.GET)
	public ModelAndView goodsDetails(@RequestParam("goodsCd") int goodsCd) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsDetails");
		mv.addObject("goodsDto", goodsService.getOneGoods(goodsCd));
		return mv;
	}
	
	
	
	
	
}
