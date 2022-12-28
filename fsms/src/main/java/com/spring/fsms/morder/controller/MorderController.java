package com.spring.fsms.morder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.fsms.morder.service.MorderService;

@Controller
public class MorderController {

	@Autowired
	private MorderService mOrderService;
}
