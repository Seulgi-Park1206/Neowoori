package com.neowoori.app;

public class BMembersState {
	int uNum;
	String uNick;
	String lastJoin;
	
	public BMembersState() {
		
	}
	public BMembersState(int uNum, String uNick, String lastJoin) {
		this.uNum = uNum;
		this.uNick = uNick;
		this.lastJoin = lastJoin;
	}
	
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public String getLastJoin() {
		return lastJoin;
	}
	public void setLastJoin(String lastJoin) {
		this.lastJoin = lastJoin;
	}
}
