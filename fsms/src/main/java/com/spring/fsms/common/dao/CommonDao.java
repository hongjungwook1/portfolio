package com.spring.fsms.common.dao;

import java.util.List;
import java.util.Map;

public interface CommonDao {
	
	public int selectOneGetBeefCnt() throws Exception;
	public List<Map<String, Object>> selectListGoodsMain()throws Exception;
	public List<Map<String, Object>> selectListLatestGoods()throws Exception;
	public List<Map<String, Object>> selectListTopPriceGoods()throws Exception;
	public List<Map<String, Object>> selectListLowestPriceGoods()throws Exception;

}
