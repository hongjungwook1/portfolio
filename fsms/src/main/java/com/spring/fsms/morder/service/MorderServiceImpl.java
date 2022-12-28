package com.spring.fsms.morder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.fsms.morder.dao.MorderDao;

@Service
public class MorderServiceImpl implements MorderService {
	
	@Autowired
	private MorderDao mOrderDao;
}
