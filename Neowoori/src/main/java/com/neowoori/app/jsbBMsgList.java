package com.neowoori.app;

public class jsbBMsgList {
	String recUNick;
	int msgNum;
	int sendUNum;
	int receiveUNum;
	String msg;
	String send_Date;
	int m_State;
	String sendUNick;
	
	jsbBMsgList(){
	}
	
	public jsbBMsgList(String recUNick, int msgNum, int sendUNum, int receiveUNum, String msg, String send_Date,
			int m_State, String sendUNick) {
		super();
		this.recUNick = recUNick;
		this.msgNum = msgNum;
		this.sendUNum = sendUNum;
		this.receiveUNum = receiveUNum;
		this.msg = msg;
		this.send_Date = send_Date;
		this.m_State = m_State;
		this.sendUNick = sendUNick;
	}
	public String getRecUNick() {
		return recUNick;
	}
	public void setRecUNick(String recUNick) {
		this.recUNick = recUNick;
	}
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public int getSendUNum() {
		return sendUNum;
	}
	public void setSendUNum(int sendUNum) {
		this.sendUNum = sendUNum;
	}
	public int getReceiveUNum() {
		return receiveUNum;
	}
	public void setReceiveUNum(int receiveUNum) {
		this.receiveUNum = receiveUNum;
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
	public int getM_State() {
		return m_State;
	}
	public void setM_State(int m_State) {
		this.m_State = m_State;
	}
	public String getSendUNick() {
		return sendUNick;
	}
	public void setSendUNick(String sendUNick) {
		this.sendUNick = sendUNick;
	}
	
	
}
