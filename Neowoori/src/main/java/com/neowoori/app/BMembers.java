package com.neowoori.app;

public class BMembers {
	int uNum;
	String userId;
	String uPw;
	String uName;
	String uNick;
	int uYear;
	int uBirthday;
	String uGender;
	int uMobile;
	String uMail;
	String address;
	String lati;
	String longi;
	
	public BMembers() {

	}
	public BMembers(int uNum, String userId, String uPw, String uName, String uNick, int uYear, int uBirthday,
			String uGender, int uMobile, String uMail, String address, String lati, String longi) {
		//super();
		this.uNum = uNum;
		this.userId = userId;
		this.uPw = uPw;
		this.uName = uName;
		this.uNick = uNick;
		this.uYear = uYear;
		this.uBirthday = uBirthday;
		this.uGender = uGender;
		this.uMobile = uMobile;
		this.uMail = uMail;
		this.address = address;
		this.lati = lati;
		this.longi = longi;
	}
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public int getuYear() {
		return uYear;
	}
	public void setuYear(int uYear) {
		this.uYear = uYear;
	}
	public int getuBirthday() {
		return uBirthday;
	}
	public void setuBirthday(int uBirthday) {
		this.uBirthday = uBirthday;
	}
	public String getuGender() {
		return uGender;
	}
	public void setuGender(String uGender) {
		this.uGender = uGender;
	}
	public int getuMobile() {
		return uMobile;
	}
	public void setuMobile(int uMobile) {
		this.uMobile = uMobile;
	}
	public String getuMail() {
		return uMail;
	}
	public void setuMail(String uMail) {
		this.uMail = uMail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLati() {
		return lati;
	}
	public void setLati(String lati) {
		this.lati = lati;
	}
	public String getLongi() {
		return longi;
	}
	public void setLongi(String longi) {
		this.longi = longi;
	}
	
	
	
}
