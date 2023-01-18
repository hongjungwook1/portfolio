package com.spring.fsms.admin.order.dao;

import java.util.List;
import java.util.Map;

public interface AdminOrderDao {

	public List<Map<String, Object>> selectGetOrderList() throws Exception;
	
}
