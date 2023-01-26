package com.spring.fsms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.fsms.common.dto.CommonDto;

@Repository
public class CommonDaoImpl implements CommonDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectOneGetBeefCnt() throws Exception {
		return sqlSession.selectOne("commonMapper.selectOneGetBeefCnt");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsMain() throws Exception {
		return sqlSession.selectList("commonMapper.selectListGoodsMain");
	}

	@Override
	public List<Map<String, Object>> selectListLatestGoods() throws Exception {
		return sqlSession.selectList("commonMapper.selectListLatestGoods");
	}

	@Override
	public List<Map<String, Object>> selectListTopPriceGoods() throws Exception {
		return sqlSession.selectList("commonMapper.selectListTopPriceGoods");
	}

	@Override
	public List<Map<String, Object>> selectListLowestPriceGoods() throws Exception {
		return sqlSession.selectList("commonMapper.selectListLowestPriceGoods");
	}

	@Override
	public void insertContact(CommonDto commonDto) throws Exception {
		sqlSession.insert("commonMapper.insertContact" , commonDto);
	}

	@Override
	public List<CommonDto> selectListGetContactList() throws Exception {
		return sqlSession.selectList("commonMapper.selectListGetContactList");
	}

	@Override
	public CommonDto selectOneGetContact(int contactCd) throws Exception {
		return sqlSession.selectOne("commonMapper.selectOneGetContact" , contactCd);
	}

	@Override
	public void deleteContact(int[] deleteContactCdList) throws Exception {
		sqlSession.delete("commonMapper.deleteContact" , deleteContactCdList);
	}
	
}
