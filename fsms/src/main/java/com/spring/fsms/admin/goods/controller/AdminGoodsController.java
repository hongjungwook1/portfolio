package com.spring.fsms.admin.goods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.admin.goods.service.AdminGoodsService;
import com.spring.fsms.goods.dto.GoodsDto;

@Controller
@RequestMapping("/admin")
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
	public String insertGoods(HttpServletRequest request) {
		
		
		GoodsDto goodsDto = new GoodsDto();
		
		goodsDto.setGoodsName(request.getParameter("goodsName"));
		goodsDto.setGoodsCnt(Integer.parseInt(request.getParameter("goodsCnt")));
		goodsDto.setDiscountRate(Integer.parseInt(request.getParameter("discountRate")));
		goodsDto.setPrice(Integer.parseInt(request.getParameter("price")));
		goodsDto.setGoodsCategory(request.getParameter("goodsCategory"));
		goodsDto.setGoodsOrigin(request.getParameter("goodsOrigin"));
		goodsDto.setGoodsInfo(request.getParameter("goodsInfo"));
		
		
		adminGoodsService.addGoods(goodsDto);
		
		String jsScript = "";
		jsScript += "<script>";
		jsScript += "alert('insert Goods');";
		jsScript += "location.href='/admin/adminMain';";
		jsScript += "</script>";
		
		
		return jsScript;
		
	}
	
	@RequestMapping(value="/goodsList" , method=RequestMethod.GET)
	public ModelAndView goodsList() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/goodsList");
		mv.addObject("goodsList", adminGoodsService.getGoodsList());
		
		return mv;
	}
	
	@RequestMapping(value="/goodsInfo" , method=RequestMethod.GET)
	public ModelAndView goodsInfo(@RequestParam("goodsCd") int goodsCd) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/goodsInfo");
		mv.addObject("goodsDto", adminGoodsService.getOneGoods(goodsCd));
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/updateGoods" , method=RequestMethod.GET)
	public ModelAndView updateGoods(@RequestParam("goodsCd") int goodsCd) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/updateGoods");
		mv.addObject("goodsDto", adminGoodsService.getOneGoods(goodsCd));
		
		return mv;
	}
	
	@RequestMapping(value="/updateGoods" , method=RequestMethod.POST)
	@ResponseBody
	public String updateGoods(GoodsDto goodsDto , HttpServletRequest request) {
		
		
		adminGoodsService.modifyGoods(goodsDto);
		
		
		String jsScript = "";
		jsScript += "<script>";
		jsScript += "alert('update Goods');";
		jsScript += "location.href='/admin/adminMain';";
		jsScript += "</script>";
		
		return jsScript;
	}
	
	
	
	
}
