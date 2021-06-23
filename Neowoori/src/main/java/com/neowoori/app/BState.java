package com.neowoori.app;

public class BState {
	int userNum;
	String lastJoin;
	String userId;
	
	public BState() {

	}
	public BState(int userNum, String lastJoin, String userId) {
		//super();
		this.userNum = userNum;
		this.lastJoin = lastJoin;
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
