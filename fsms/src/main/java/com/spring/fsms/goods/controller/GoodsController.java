package com.spring.fsms.goods.controller;

import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.common.service.CommonService;
import com.spring.fsms.goods.service.GoodsService;


@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value="/goodsList" , method=RequestMethod.GET)
	public ModelAndView goodsList (@RequestParam Map<String, String> goodsListMap , 
								   @RequestParam(name = "onePageViewCount"  , defaultValue = "10")    int onePageViewCount,
								   @RequestParam(name = "currentPageNumber" , defaultValue = "1")     int currentPageNumber,
								   @RequestParam(name = "searchKeyword"     , defaultValue = "total") String searchKeyword,
							       @RequestParam(name = "searchWord"        , defaultValue = "")      String searchWord) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsList");
		
		int startBoardIdx =  (currentPageNumber -1) * onePageViewCount + 1;
		if (currentPageNumber == 1) startBoardIdx = 0;
		
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("onePageViewCount" , onePageViewCount);
		searchInfo.put("startBoardIdx"    , startBoardIdx);
		searchInfo.put("searchKeyword"    , searchKeyword);
		searchInfo.put("searchWord"       , searchWord);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchKeyword", searchKeyword);
		searchMap.put("searchWord", searchWord);
		
		int totalViewCount = goodsService.getTotalViewCount(searchMap);
		int addPage = totalViewCount % onePageViewCount == 0 ? 0 : 1; 
		int totalPageCount = totalViewCount / onePageViewCount + addPage;
		
		
		int startPage = 1;
		
		if (currentPageNumber % 10 == 0) startPage = (currentPageNumber / 10 - 1) * 10 + 1;
		else 							 startPage = (currentPageNumber / 10) * 10 + 1;							
		
		
		int endPage = startPage + 9;
		
		// 끝페이지가 전체 페이지 개수보다 크다면 
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		// 게시물이 한페이지에 보여지는 것보다 작다면
		if (onePageViewCount > totalViewCount) {
			startPage = 1;
			endPage = 0;
		}
		
		mv.addObject("startPage"         , startPage);
		mv.addObject("endPage"           , endPage);
		mv.addObject("totalViewCount"   , totalViewCount);
		mv.addObject("onePageViewCount"  , onePageViewCount);
		mv.addObject("currentPageNumber" , currentPageNumber);
		mv.addObject("searchKeyword"     , searchKeyword);
		mv.addObject("searchWord"        , searchWord);
		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		
		
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value="/goodsList" , method=RequestMethod.GET)
//	public ModelAndView goodsList(@RequestParam Map<String,String> goodsListMap) throws Exception {
//		
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("/goods/goodsList");
//		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
//		mv.addObject("goodsCnt", goodsService.getGoodCnt());
//		mv.addObject("latestList", commonService.getlatestGoodsInfo());
//		
//		return mv;
//	}
	
	@RequestMapping(value="/goodsDetails" , method=RequestMethod.GET)
	public ModelAndView goodsDetails(@RequestParam("goodsCd") int goodsCd) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsDetails");
		mv.addObject("goodsDto", goodsService.getOneGoods(goodsCd));
		return mv;
	}
	
//	@RequestMapping(value="/searchGoods" , method=RequestMethod.GET)
//	public ModelAndView goodsDetails (@RequestParam Map<String,Object> searchMap) throws Exception {
//		
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("/goods/goodsList");
//		mv.addObject("goodsList", goodsService.getSearchGoods(searchMap));
//		mv.addObject("latestList", commonService.getlatestGoodsInfo());
//		
//		return mv;
//	}
	
	
	
	
}
