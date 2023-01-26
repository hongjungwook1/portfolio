package com.spring.fsms.common.service;

import java.util.List;
import java.util.Map;

import com.spring.fsms.common.dto.CommonDto;
import com.spring.fsms.goods.dto.GoodsDto;

public interface CommonService {
	
	public int getBeefCnt() throws Exception;
	public List<Map<String, Object>> getGoodsMainInfo ()throws Exception;
	public List<Map<String, Object>> getlatestGoodsInfo ()throws Exception;
	public List<Map<String, Object>> getTopPriceGoodsInfo ()throws Exception;
	public List<Map<String, Object>> getlowestPriceGoodsInfo ()throws Exception;
	public void newContact(CommonDto commonDto) throws Exception;
	public List<CommonDto> getContactList () throws Exception;
	public CommonDto getOneContact(int contactCd) throws Exception;
	public void removeContact(int [] deleteContactCdList) throws Exception;
	
}
