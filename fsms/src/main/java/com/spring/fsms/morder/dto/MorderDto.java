package com.spring.fsms.morder.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MorderDto {

	private	int mOrderCd;
	private String memberId;
	private int goodsCd;
	private int mOrderGoodsQty;
	private	String mOrderName;
	private	String mOrderHp;
	private	String mOrderReceiverName;
	private	String mOrderReceiverHp;
	private String mOrderDeliveryMethod;
	private String mOrderPayMethod;
	private String mOrderPayOrdererHp;
	private String mOrderCardCompanyName;
	private String mOrderCardPayMonth;
	private String mOrderDeliveryMessage;
	private String mOrderDeliveryStatus;
	private	String mOrderZipcode;
	private	String mOrderRoadAddress;
	private	String mOrderJibunAddress;
	private	String mOrderNamujiAddress;
	private Date mOrderPayOrderTime;
	public int getmOrderCd() {
		return mOrderCd;
	}
	public void setmOrderCd(int mOrderCd) {
		this.mOrderCd = mOrderCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public int getmOrderGoodsQty() {
		return mOrderGoodsQty;
	}
	public void setmOrderGoodsQty(int mOrderGoodsQty) {
		this.mOrderGoodsQty = mOrderGoodsQty;
	}
	public String getmOrderName() {
		return mOrderName;
	}
	public void setmOrderName(String mOrderName) {
		this.mOrderName = mOrderName;
	}
	public String getmOrderHp() {
		return mOrderHp;
	}
	public void setmOrderHp(String mOrderHp) {
		this.mOrderHp = mOrderHp;
	}
	public String getmOrderReceiverName() {
		return mOrderReceiverName;
	}
	public void setmOrderReceiverName(String mOrderReceiverName) {
		this.mOrderReceiverName = mOrderReceiverName;
	}
	public String getmOrderReceiverHp() {
		return mOrderReceiverHp;
	}
	public void setmOrderReceiverHp(String mOrderReceiverHp) {
		this.mOrderReceiverHp = mOrderReceiverHp;
	}
	public String getmOrderDeliveryMethod() {
		return mOrderDeliveryMethod;
	}
	public void setmOrderDeliveryMethod(String mOrderDeliveryMethod) {
		this.mOrderDeliveryMethod = mOrderDeliveryMethod;
	}
	public String getmOrderPayMethod() {
		return mOrderPayMethod;
	}
	public void setmOrderPayMethod(String mOrderPayMethod) {
		this.mOrderPayMethod = mOrderPayMethod;
	}
	public String getmOrderPayOrdererHp() {
		return mOrderPayOrdererHp;
	}
	public void setmOrderPayOrdererHp(String mOrderPayOrdererHp) {
		this.mOrderPayOrdererHp = mOrderPayOrdererHp;
	}
	public String getmOrderCardCompanyName() {
		return mOrderCardCompanyName;
	}
	public void setmOrderCardCompanyName(String mOrderCardCompanyName) {
		this.mOrderCardCompanyName = mOrderCardCompanyName;
	}
	public String getmOrderCardPayMonth() {
		return mOrderCardPayMonth;
	}
	public void setmOrderCardPayMonth(String mOrderCardPayMonth) {
		this.mOrderCardPayMonth = mOrderCardPayMonth;
	}
	public String getmOrderDeliveryMessage() {
		return mOrderDeliveryMessage;
	}
	public void setmOrderDeliveryMessage(String mOrderDeliveryMessage) {
		this.mOrderDeliveryMessage = mOrderDeliveryMessage;
	}
	public String getmOrderDeliveryStatus() {
		return mOrderDeliveryStatus;
	}
	public void setmOrderDeliveryStatus(String mOrderDeliveryStatus) {
		this.mOrderDeliveryStatus = mOrderDeliveryStatus;
	}
	public String getmOrderZipcode() {
		return mOrderZipcode;
	}
	public void setmOrderZipcode(String mOrderZipcode) {
		this.mOrderZipcode = mOrderZipcode;
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
	public Date getmOrderPayOrderTime() {
		return mOrderPayOrderTime;
	}
	public void setmOrderPayOrderTime(Date mOrderPayOrderTime) {
		this.mOrderPayOrderTime = mOrderPayOrderTime;
	}
	
	@Override
	public String toString() {
		return "MorderDto [mOrderCd=" + mOrderCd + ", memberId=" + memberId + ", goodsCd=" + goodsCd
				+ ", mOrderGoodsQty=" + mOrderGoodsQty + ", mOrderName=" + mOrderName + ", mOrderHp=" + mOrderHp
				+ ", mOrderReceiverName=" + mOrderReceiverName + ", mOrderReceiverHp=" + mOrderReceiverHp
				+ ", mOrderDeliveryMethod=" + mOrderDeliveryMethod + ", mOrderPayMethod=" + mOrderPayMethod
				+ ", mOrderPayOrdererHp=" + mOrderPayOrdererHp + ", mOrderCardCompanyName=" + mOrderCardCompanyName
				+ ", mOrderCardPayMonth=" + mOrderCardPayMonth + ", mOrderDeliveryMessage=" + mOrderDeliveryMessage
				+ ", mOrderDeliveryStatus=" + mOrderDeliveryStatus + ", mOrderZipcode=" + mOrderZipcode
				+ ", mOrderRoadAddress=" + mOrderRoadAddress + ", mOrderJibunAddress=" + mOrderJibunAddress
				+ ", mOrderNamujiAddress=" + mOrderNamujiAddress + ", mOrderPayOrderTime=" + mOrderPayOrderTime + "]";
	}
	

	
	
	
	




}
