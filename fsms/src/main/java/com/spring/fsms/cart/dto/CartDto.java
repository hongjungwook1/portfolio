package com.spring.fsms.cart.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class CartDto {
	
	private	int cartCd;
	private	int goodsCd;
	private	int cartQty;
	private	String memberId;
	private	Date cartDate;
	
	public int getCartCd() {
		return cartCd;
	}
	public void setCartCd(int cartCd) {
		this.cartCd = cartCd;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getCartDate() {
		return cartDate;
	}
	public void setCartDate(Date cartDate) {
		this.cartDate = cartDate;
	}
	@Override
	public String toString() {
		return "CartDto [cartCd=" + cartCd + ", goodsCd=" + goodsCd + ", cartQty=" + cartQty + ", memberId=" + memberId
				+ ", cartDate=" + cartDate + "]";
	}
	
	
	
}
