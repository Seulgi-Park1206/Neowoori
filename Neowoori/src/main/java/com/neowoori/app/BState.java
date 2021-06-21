package com.neowoori.app;

public class BState {
	int userNum;
	String lastJoin;
	
	public BState() {

	}
	public BState(int userNum, String lastJoin) {
		//super();
		this.userNum = userNum;
		this.lastJoin = lastJoin;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getLastJoin() {
		return lastJoin;
	}
	public void setLastJoin(String lastJoin) {
		this.lastJoin = lastJoin;
	}
	
}
