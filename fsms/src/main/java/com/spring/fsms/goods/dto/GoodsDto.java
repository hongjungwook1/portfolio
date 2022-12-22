package com.spring.fsms.goods.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class GoodsDto {
	
	private String goodsCd;
	private	String goodsName;
	private int goodsCnt;
	private	int discountRate;
	private	int price;
	private	String goodsFileName;	
	private	Date regDate;
	private	String goodsInfo; 	
	private	String goodsOrigin;	
	private	String goodsCategory;
	
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsCnt() {
		return goodsCnt;
	}
	public void setGoodsCnt(int goodsCnt) {
		this.goodsCnt = goodsCnt;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGoodsFileName() {
		return goodsFileName;
	}
	public void setGoodsFileName(String goodsFileName) {
		this.goodsFileName = goodsFileName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getGoodsInfo() {
		return goodsInfo;
	}
	public void setGoodsInfo(String goodsInfo) {
		this.goodsInfo = goodsInfo;
	}
	public String getGoodsOrigin() {
		return goodsOrigin;
	}
	public void setGoodsOrigin(String goodsOrigin) {
		this.goodsOrigin = goodsOrigin;
	}
	public String getGoodsCategory() {
		return goodsCategory;
	}
	public void setGoodsCategory(String goodsCategory) {
		this.goodsCategory = goodsCategory;
	}
	
	/*
	 * CREATE TABLE GOODS (
	GOODS_CD INT PRIMARY KEY AUTO_INCREMENT,
    GOODS_NAME VARCHAR(500),
	GOODS_CNT INT,
    DISCOUNT_RATE INT,
    PRICE INT,
    GOODS_FILE_NAME VARCHAR(2000),
    REG_DATE DATETIME,
    GOODS_INFO VARCHAR(2000),
    GOODS_ORIGIN VARCHAR(50),
    GOODS_CATEGORY VARCHAR(100)
);
	 * 
	 */
	
	
	
	
	
}
