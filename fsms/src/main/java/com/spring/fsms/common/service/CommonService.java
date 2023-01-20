package com.spring.fsms.common.service;

import java.util.List;
import java.util.Map;

import com.spring.fsms.goods.dto.GoodsDto;

public interface CommonService {
	
	public int getBeefCnt() throws Exception;
	public List<Map<String, Object>> getGoodsMainInfo ()throws Exception;
	public List<Map<String, Object>> getlatestGoodsInfo ()throws Exception;
	public List<Map<String, Object>> getTopPriceGoodsInfo ()throws Exception;
	public List<Map<String, Object>> getlowestPriceGoodsInfo ()throws Exception;
	
	
}
