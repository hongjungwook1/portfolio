package com.spring.fsms.goods.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.goods.service.GoodsService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	
	private final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	private final String SEPERATOR = "\\";											// window

	//private final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo";
	//private final String SEPERATOR = "/";											// linux
	
	
	
	
	@RequestMapping(value="/goodsMain" , method=RequestMethod.GET)
	public ModelAndView goodsMain () {
		return new ModelAndView("/goods/goodsMain");
	}
	
	@RequestMapping(value="/goodsList" , method=RequestMethod.GET)
	public ModelAndView goodsList(@RequestParam Map<String,String> goodsListMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsList");
		mv.addObject("goodsList", goodsService.getGoodsList(goodsListMap));
		return mv;
	}
	
	@RequestMapping(value="/goodsDetails" , method=RequestMethod.GET)
	public ModelAndView goodsDetails(@RequestParam("goodsCd") int goodsCd) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/goods/goodsDetails");
		mv.addObject("goodsDto", goodsService.getOneGoods(goodsCd));
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/thumbnails")
	public void thumbnails(@RequestParam("goodsFileName") String goodsFileName , HttpServletResponse response) throws Exception {
	
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + SEPERATOR + goodsFileName;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("jpg").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}
	
	
	
	
	
}
