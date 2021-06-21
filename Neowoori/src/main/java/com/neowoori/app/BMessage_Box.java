package com.neowoori.app;

public class BMessage_Box {
	int boxNum;
	int msgNum;
	int senduNum;
	int receiveuNum;
	String msg;
	String send_Date;
	int mbox_State;
	
	public BMessage_Box() {

	}
	public BMessage_Box(int boxNum, int msgNum, int senduNum, int receiveuNum, String msg, String send_Date,
			int mbox_State) {
		//super();
		this.boxNum = boxNum;
		this.msgNum = msgNum;
		this.senduNum = senduNum;
		this.receiveuNum = receiveuNum;
		this.msg = msg;
		this.send_Date = send_Date;
		this.mbox_State = mbox_State;
	}
	public int getBoxNum() {
		return boxNum;
	}
	public void setBoxNum(int boxNum) {
		this.boxNum = boxNum;
	}
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public int getSenduNum() {
		return senduNum;
	}
	public void setSenduNum(int senduNum) {
		this.senduNum = senduNum;
	}
	public int getReceiveuNum() {
		return receiveuNum;
	}
	public void setReceiveuNum(int receiveuNum) {
		this.receiveuNum = receiveuNum;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSend_Date() {
		return send_Date;
	}
	public void setSend_Date(String send_Date) {
		this.send_Date = send_Date;
	}
	public int getMbox_State() {
		return mbox_State;
	}
	public void setMbox_State(int mbox_State) {
		this.mbox_State = mbox_State;
	}
}
