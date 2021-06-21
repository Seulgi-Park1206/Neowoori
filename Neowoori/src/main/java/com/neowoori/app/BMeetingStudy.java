package com.neowoori.app;

public class BMeetingStudy {
	int uNum;
	int mNum;
	
	public BMeetingStudy() {

	}
	public BMeetingStudy(int uNum, int mNum) {
		//super();
		this.uNum = uNum;
		this.mNum = mNum;
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
	
	
}
