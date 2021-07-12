package com.neowoori.app;

public class jsbBMeetUserList2 {
	int uNum;
	int mNum;
	String uNick;
	String uGender;
	String uMail;
	int state;
	
	jsbBMeetUserList2(){
	}

	public jsbBMeetUserList2(int uNum, int mNum, String uNick, String uGender, String uMail, int state) {
		super();
		this.uNum = uNum;
		this.mNum = mNum;
		this.uNick = uNick;
		this.uGender = uGender;
		this.uMail = uMail;
		this.state = state;
	}

	public int getuNum() {
		return uNum;
	}

	public void setuNum(int uNum) {
		this.uNum = uNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getuNick() {
		return uNick;
	}

	public void setuNick(String uNick) {
		this.uNick = uNick;
	}

	public String getuGender() {
		return uGender;
	}

	public void setuGender(String uGender) {
		this.uGender = uGender;
	}

	public String getuMail() {
		return uMail;
	}

	public void setuMail(String uMail) {
		this.uMail = uMail;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	
	
}
