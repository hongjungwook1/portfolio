package com.spring.fsms.admin.goods.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.admin.goods.service.AdminGoodsService;
import com.spring.fsms.goods.dto.GoodsDto;

@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {

	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Autowired
	private GoodsDto goodsDto;
	
	@RequestMapping(value="adminMain" , method=RequestMethod.GET)
	public ModelAndView adminMain () throws Exception{
		return new ModelAndView("/admin/adminMain");
	}
	
	
	
	@RequestMapping(value="/insertGoods" , method=RequestMethod.GET)
	public ModelAndView insertGoods() throws Exception {
		return new ModelAndView("/admin/goods/insertGoods");
	}
	
	@RequestMapping(value="/insertGoods" , method=RequestMethod.POST)
	public ResponseEntity<Object> insertGoods(MultipartHttpServletRequest request) throws Exception{
		
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
		jsScript += "alert('상품이 추가 되었습니다.');";
		jsScript += "location.href='"  + request.getContextPath() + "/admin/goods/adminMain';";
		jsScript += "</script>";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/goodsList" , method=RequestMethod.GET)
	public ModelAndView goodsList() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/goods/goodsList");
		mv.addObject("goodsList", adminGoodsService.getGoodsList());
		
		return mv;
	}
	
	@RequestMapping(value="/goodsInfo" , method=RequestMethod.GET)
	public ModelAndView goodsInfo(@RequestParam("goodsCd") int goodsCd) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/goods/goodsInfo");
		mv.addObject("goodsDto", adminGoodsService.getOneGoods(goodsCd));
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/updateGoods" , method=RequestMethod.GET)
	public ModelAndView updateGoods(@RequestParam("goodsCd") int goodsCd) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/goods/updateGoods");
		mv.addObject("goodsDto", adminGoodsService.getOneGoods(goodsCd));
		
		return mv;
	}
	
	@RequestMapping(value="/updateGoods" , method=RequestMethod.POST)
	public ResponseEntity<Object> updateGoods(GoodsDto goodsDto , HttpServletRequest request) throws Exception {
		
		
		adminGoodsService.modifyGoods(goodsDto);
		
		
		String jsScript = "";
		jsScript += "<script>";
		jsScript += "alert('상품을 수정하였습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/admin/goods/adminMain';";
		jsScript += "</script>";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
	}
	
	
	@RequestMapping(value="deleteGoods" , method=RequestMethod.GET)
	public ModelAndView deleteGoods(@RequestParam("goodsCd") int goodsCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/goods/deleteGoods");
		mv.addObject("goodsDto", adminGoodsService.getOneGoods(goodsCd));
		
		return mv;
	}
	
	
	@RequestMapping(value="deleteGoods" , method=RequestMethod.POST)
	public ResponseEntity<Object> deleteGoods(GoodsDto goodsDto , HttpServletRequest request) throws Exception {
		
		adminGoodsService.deleteGoods(goodsDto);
		
		String jsScript="";
		jsScript += "<script>";
		jsScript += "alert('상품을 삭제하였습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/admin/goods/adminMain';";
		jsScript += "</script>";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<Object>(jsScript , header , HttpStatus.OK);
		
	}
	
	
}
