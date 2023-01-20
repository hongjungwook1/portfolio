package com.spring.fsms.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.fsms.common.service.CommonService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class CommonController {

	@Autowired
	private CommonService commonService;
	
	private final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	private final String SEPERATOR = "\\";											// window

	//private final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo";
	//private final String SEPERATOR = "/";											// linux
	
	@RequestMapping("/thumbnails")
	public void thumbnails (@RequestParam("goodsFileName") String goodsFileName , HttpServletResponse response) throws Exception {
		
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
	
	
	
	@RequestMapping(value="/" , method=RequestMethod.GET)
	public ModelAndView home ()throws Exception{
		
		ModelAndView mv = new ModelAndView("/member/main");
		
		Map<String, String> goodsListMap = new HashMap<String, String>();
		goodsListMap.put("goodsOrigin", "all");
		goodsListMap.put("goodsCategory", "all");

		mv.addObject("beefCnt", commonService.getBeefCnt());
		mv.addObject("goodsList", commonService.getGoodsMainInfo());
		mv.addObject("latestList", commonService.getlatestGoodsInfo());
		mv.addObject("topPriceList", commonService.getTopPriceGoodsInfo());
		mv.addObject("lowestPriceList", commonService.getlowestPriceGoodsInfo());
		
		return mv;
	}
	
	
}
