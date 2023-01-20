package com.spring.fsms.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.common.dao.CommonDao;
import com.spring.fsms.goods.dto.GoodsDto;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private CommonDao commonDao;

	@Override
	public int getBeefCnt() throws Exception {
		return commonDao.selectOneGetBeefCnt();
	}

	@Override
	public List<Map<String, Object>> getGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsMain();
	}

	@Override
	public List<Map<String, Object>> getlatestGoodsInfo() throws Exception {
		return commonDao.selectListLatestGoods();
	}

	@Override
	public List<Map<String, Object>> getTopPriceGoodsInfo() throws Exception {
		return commonDao.selectListTopPriceGoods();
	}

	@Override
	public List<Map<String, Object>> getlowestPriceGoodsInfo() throws Exception {
		return commonDao.selectListLowestPriceGoods();
	}

}
