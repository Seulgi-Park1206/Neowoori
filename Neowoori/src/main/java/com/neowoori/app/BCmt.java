package com.neowoori.app;

public class BCmt {
	int postNum;
	int cmtNum;
	int uNum;
	String cmt_Contents;
	int cmt_Date;
	int cmt_State;
	
	public BCmt() {

	}
	public BCmt(int postNum, int cmtNum, int uNum, String cmt_Contents, int cmt_Date, int cmt_State) {
		//super();
		this.postNum = postNum;
		this.cmtNum = cmtNum;
		this.uNum = uNum;
		this.cmt_Contents = cmt_Contents;
		this.cmt_Date = cmt_Date;
		this.cmt_State = cmt_State;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getCmtNum() {
		return cmtNum;
	}
	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getCmt_Contents() {
		return cmt_Contents;
	}
	public void setCmt_Contents(String cmt_Contents) {
		this.cmt_Contents = cmt_Contents;
	}
	public int getCmt_Date() {
		return cmt_Date;
	}
	public void setCmt_Date(int cmt_Date) {
		this.cmt_Date = cmt_Date;
	}
	public int getCmt_State() {
		return cmt_State;
	}
	public void setCmt_State(int cmt_State) {
		this.cmt_State = cmt_State;
	}
}
