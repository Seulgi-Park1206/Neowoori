package com.neowoori.app;

public class PJH_BMeetingState {
	int uNum;
	int mNum;
	int state;
	String mname; 
	String category1; 
	String category2; 
	String mwhere;
	
	public PJH_BMeetingState() {
		
	}
	public PJH_BMeetingState(int uNum, int mNum, int state, String mname, String category1, String category2, String mwhere) {
		this.uNum = uNum;
		this.mNum = mNum;
		this.state = state;
		this.mname = mname;
		this.category1 = category1;
		this.category2 = category2;
		this.mwhere = mwhere;
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
	public String getMname() {
		return mname;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getMwhere() {
		return mwhere;
	}
	public void setMwhere(String mwhere) {
		this.mwhere = mwhere;
	}
}
