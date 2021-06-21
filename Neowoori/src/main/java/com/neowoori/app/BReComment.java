package com.neowoori.app;

public class BReComment {
	int cmtNum;
	int recmtNum;
	int uNum;
	String r_Nontents;
	int r_Date;
	int r_State;
	
	
	public BReComment() {
	}
	public BReComment(int cmtNum, int recmtNum, int uNum, String r_Nontents, int r_Date, int r_State) {
		//super();
		this.cmtNum = cmtNum;
		this.recmtNum = recmtNum;
		this.uNum = uNum;
		this.r_Nontents = r_Nontents;
		this.r_Date = r_Date;
		this.r_State = r_State;
	}
	public int getCmtNum() {
		return cmtNum;
	}
	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}
	public int getRecmtNum() {
		return recmtNum;
	}
	public void setRecmtNum(int recmtNum) {
		this.recmtNum = recmtNum;
	}
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getR_Nontents() {
		return r_Nontents;
	}
	public void setR_Nontents(String r_Nontents) {
		this.r_Nontents = r_Nontents;
	}
	public int getR_Date() {
		return r_Date;
	}
	public void setR_Date(int r_Date) {
		this.r_Date = r_Date;
	}
	public int getR_State() {
		return r_State;
	}
	public void setR_State(int r_State) {
		this.r_State = r_State;
	}
	
}
