package com.spring.fsms.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {
	
	public int getBeefCnt() throws Exception;
	public List<Map<String, Object>> getGoodsMainInfo ()throws Exception;
	
}
