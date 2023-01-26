package com.spring.fsms.common.dao;

import java.util.List;
import java.util.Map;

import com.spring.fsms.common.dto.CommonDto;

public interface CommonDao {
	
	public int selectOneGetBeefCnt() throws Exception;
	public List<Map<String, Object>> selectListGoodsMain()throws Exception;
	public List<Map<String, Object>> selectListLatestGoods()throws Exception;
	public List<Map<String, Object>> selectListTopPriceGoods()throws Exception;
	public List<Map<String, Object>> selectListLowestPriceGoods()throws Exception;
	public void insertContact (CommonDto commonDto) throws Exception;
	public List<CommonDto> selectListGetContactList () throws Exception;
	public CommonDto selectOneGetContact (int contactCd) throws Exception;
	public void deleteContact(int [] deleteContactCdList) throws Exception;
	
}
