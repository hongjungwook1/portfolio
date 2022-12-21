package com.spring.fsms.admin.member.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class AdminDto {

	private String adminId;
	private String adminPw;
	private Date adminJoinDt;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public Date getAdminJoinDt() {
		return adminJoinDt;
	}
	public void setAdminJoinDt(Date adminJoinDt) {
		this.adminJoinDt = adminJoinDt;
	}
	
	@Override
	public String toString() {
		return "AdminDto [adminId=" + adminId + ", adminPw=" + adminPw + ", adminJoinDt=" + adminJoinDt + "]";
	}
	
}
