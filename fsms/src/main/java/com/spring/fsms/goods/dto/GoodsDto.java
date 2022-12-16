package com.spring.fsms.goods.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsDto {
	
	private String GOODS_CD;
	private	String GOODS_NAME;
	private int GOODS_CNT;
	private	int DISCOUNT_RATE;
	private	int PRICE;
	private	String GOODS_FILE_NAME;	
	private	Date REG_DATE;
	private	String GOODS_INFO; 	
	private	String GOODS_ORIGIN;	
	private	String GOODS_CATEGORY;
	
	public String getGOODS_CD() {
		return GOODS_CD;
	}
	public void setGOODS_CD(String gOODS_CD) {
		GOODS_CD = gOODS_CD;
	}
	public String getGOODS_NAME() {
		return GOODS_NAME;
	}
	public void setGOODS_NAME(String gOODS_NAME) {
		GOODS_NAME = gOODS_NAME;
	}
	public int getGOODS_CNT() {
		return GOODS_CNT;
	}
	public void setGOODS_CNT(int gOODS_CNT) {
		GOODS_CNT = gOODS_CNT;
	}
	public int getDISCOUNT_RATE() {
		return DISCOUNT_RATE;
	}
	public void setDISCOUNT_RATE(int dISCOUNT_RATE) {
		DISCOUNT_RATE = dISCOUNT_RATE;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getGOODS_FILE_NAME() {
		return GOODS_FILE_NAME;
	}
	public void setGOODS_FILE_NAME(String gOODS_FILE_NAME) {
		GOODS_FILE_NAME = gOODS_FILE_NAME;
	}
	public Date getREG_DATE() {
		return REG_DATE;
	}
	public void setREG_DATE(Date rEG_DATE) {
		REG_DATE = rEG_DATE;
	}
	public String getGOODS_INFO() {
		return GOODS_INFO;
	}
	public void setGOODS_INFO(String gOODS_INFO) {
		GOODS_INFO = gOODS_INFO;
	}
	public String getGOODS_ORIGIN() {
		return GOODS_ORIGIN;
	}
	public void setGOODS_ORIGIN(String gOODS_ORIGIN) {
		GOODS_ORIGIN = gOODS_ORIGIN;
	}
	public String getGOODS_CATEGORY() {
		return GOODS_CATEGORY;
	}
	public void setGOODS_CATEGORY(String gOODS_CATEGORY) {
		GOODS_CATEGORY = gOODS_CATEGORY;
	}
	
	
	
	
	
	
	
	
	
	
}
