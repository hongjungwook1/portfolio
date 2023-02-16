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
	public ModelAndView goodsList(@RequestParam(name = "onePageViewCount"  , defaultValue = "9")    int onePageViewCount,
								  @RequestParam(name = "currentPageNumber" , defaultValue = "1")     int currentPageNumber,
								  @RequestParam(name = "searchKeyword"     , defaultValue = "total") String searchKeyword,
								  @RequestParam(name = "searchWord"        , defaultValue = "")      String searchWord) throws Exception {
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsList");
		
		int startGoodsIdx =  (currentPageNumber -1) * onePageViewCount + 1;
		if (currentPageNumber == 1) startGoodsIdx = 0;
		
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("onePageViewCount" , onePageViewCount);
		searchInfo.put("startGoodsIdx"    , startGoodsIdx);
		searchInfo.put("searchKeyword"    , searchKeyword);
		searchInfo.put("searchWord"       , searchWord);
		List<GoodsDto> goodsList = goodsService.getGoodsList(searchInfo);
		
		Map<String, String> searchCountInfo = new HashMap<String, String>();
		searchCountInfo.put("searchKeyword", searchKeyword);
		searchCountInfo.put("searchWord", searchWord);
		
		int totalGoodsCnt = goodsService.getTotalGoodsCount(searchCountInfo);
		int addPage = totalGoodsCnt % onePageViewCount == 0 ? 0 : 1; 	
		int totalPageCount = totalGoodsCnt / onePageViewCount + addPage;
		
		
		int startPage = 1;
		
		if (currentPageNumber % 10 == 0) startPage = (currentPageNumber / 10 - 1) * 10 + 1;
		else 							 startPage = (currentPageNumber / 10) * 10 + 1;							
		
		int endPage = startPage + 9;
			
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		if (onePageViewCount > totalGoodsCnt) {
			startPage = 1;
			endPage = 0;
		}
		
				
		mv.addObject("startPage"         , startPage);
		mv.addObject("endPage"           , endPage);
		mv.addObject("totalGoodsCnt"     , totalGoodsCnt);
		mv.addObject("onePageViewCount"  , onePageViewCount);
		mv.addObject("currentPageNumber" , currentPageNumber);
		mv.addObject("searchKeyword"     , searchKeyword);
		mv.addObject("searchWord"        , searchWord);
		mv.addObject("goodsList"         , goodsList);		
		mv.addObject("latestList", commonService.getlatestGoodsInfo());
		
		return mv;
		
	}
	
	@RequestMapping(value="/goodsCategory" , method=RequestMethod.GET)
	public ModelAndView goodsCategoryList(@RequestParam Map<String,Object> goodsListMap ,
										  @RequestParam ("goodsCategory") String goodsCategory) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsCategory");
		mv.addObject("goodsList", goodsService.getGoodsCategoryList(goodsListMap));
		mv.addObject("totalGoodsCnt", goodsService.getTotalGoodsCnt(goodsCategory));
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
		
		mv.setViewName("/goods/goodsSearchList");
		mv.addObject("goodsList", goodsService.getSearchGoods(searchMap));
		mv.addObject("latestList", commonService.getlatestGoodsInfo());
		
		return mv;
	}
	
	
	
	
}
