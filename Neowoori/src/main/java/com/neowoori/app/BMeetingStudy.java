package com.neowoori.app;

public class BMeetingStudy {
	int uNum;
	int mNum;
	int State;
	
	public BMeetingStudy() {

	}
	public BMeetingStudy(int uNum, int mNum, int State) {
		//super();
		this.uNum = uNum;
		this.mNum = mNum;
		this.State = State;
	}
	
	public int getState() {
		return State;
	}
	public void setState(int State) {
		this.State = State;
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
