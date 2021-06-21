package com.neowoori.app;

public class BAdminAccount {
	int adminNum;
	String adminId;
	String adminPw;
	
	public BAdminAccount() {

	}
		
	public BAdminAccount(int adminNum, String adminId, String adminPw) {
		//super();
		this.adminNum = adminNum;
		this.adminId = adminId;
		this.adminPw = adminPw;
	}
	
	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
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
}
