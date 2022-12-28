package com.spring.fsms.morder.dto;

import org.springframework.stereotype.Component;

@Component
public class MorderDto {

	private	int mOrderCd;
	private String mOrderId;
	private	String mOrderName;
	private int mOrderQty;
	private int mOrderPrice;
	private	int mDeliveryPrice;
	private	int mTotalPrice;
	private	int mPointReserve;
	private	String mOrderRoadAddress;
	private	String mOrderJibunAddress;
	private	String mOrderNamujiAddress;
	public int getmOrderCd() {
		return mOrderCd;
	}
	public void setmOrderCd(int mOrderCd) {
		this.mOrderCd = mOrderCd;
	}
	public String getmOrderId() {
		return mOrderId;
	}
	public void setmOrderId(String mOrderId) {
		this.mOrderId = mOrderId;
	}
	public String getmOrderName() {
		return mOrderName;
	}
	public void setmOrderName(String mOrderName) {
		this.mOrderName = mOrderName;
	}
	public int getmOrderQty() {
		return mOrderQty;
	}
	public void setmOrderQty(int mOrderQty) {
		this.mOrderQty = mOrderQty;
	}
	public int getmOrderPrice() {
		return mOrderPrice;
	}
	public void setmOrderPrice(int mOrderPrice) {
		this.mOrderPrice = mOrderPrice;
	}
	public int getmDeliveryPrice() {
		return mDeliveryPrice;
	}
	public void setmDeliveryPrice(int mDeliveryPrice) {
		this.mDeliveryPrice = mDeliveryPrice;
	}
	public int getmTotalPrice() {
		return mTotalPrice;
	}
	public void setmTotalPrice(int mTotalPrice) {
		this.mTotalPrice = mTotalPrice;
	}
	public int getmPointReserve() {
		return mPointReserve;
	}
	public void setmPointReserve(int mPointReserve) {
		this.mPointReserve = mPointReserve;
	}
	public String getmOrderRoadAddress() {
		return mOrderRoadAddress;
	}
	public void setmOrderRoadAddress(String mOrderRoadAddress) {
		this.mOrderRoadAddress = mOrderRoadAddress;
	}
	public String getmOrderJibunAddress() {
		return mOrderJibunAddress;
	}
	public void setmOrderJibunAddress(String mOrderJibunAddress) {
		this.mOrderJibunAddress = mOrderJibunAddress;
	}
	public String getmOrderNamujiAddress() {
		return mOrderNamujiAddress;
	}
	public void setmOrderNamujiAddress(String mOrderNamujiAddress) {
		this.mOrderNamujiAddress = mOrderNamujiAddress;
	}
	@Override
	public String toString() {
		return "MorderDto [mOrderCd=" + mOrderCd + ", mOrderId=" + mOrderId + ", mOrderName=" + mOrderName
				+ ", mOrderQty=" + mOrderQty + ", mOrderPrice=" + mOrderPrice + ", mDeliveryPrice=" + mDeliveryPrice
				+ ", mTotalPrice=" + mTotalPrice + ", mPointReserve=" + mPointReserve + ", mOrderRoadAddress="
				+ mOrderRoadAddress + ", mOrderJibunAddress=" + mOrderJibunAddress + ", mOrderNamujiAddress="
				+ mOrderNamujiAddress + "]";
	}
	
	
	
}
