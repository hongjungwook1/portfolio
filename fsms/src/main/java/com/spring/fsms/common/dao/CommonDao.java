package com.spring.fsms.common.dao;

import java.util.List;
import java.util.Map;

public interface CommonDao {
	
	public int selectOneGetBeefCnt() throws Exception;
	public List<Map<String, Object>> selectListGoodsMain()throws Exception;

}
