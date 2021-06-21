package com.neowoori.app;

public class BMassage {
	int msgnum;
	int sendunum;
	int receiveunum;
	String msg;
	String send_date;
	int m_state;
	
	
	public BMassage() {

	}
	public BMassage(int msgnum, int sendunum, int receiveunum, String msg, String send_date, int m_state) {
		//super();
		this.msgnum = msgnum;
		this.sendunum = sendunum;
		this.receiveunum = receiveunum;
		this.msg = msg;
		this.send_date = send_date;
		this.m_state = m_state;
	}
	public int getMsgnum() {
		return msgnum;
	}
	public void setMsgnum(int msgnum) {
		this.msgnum = msgnum;
	}
	public int getSendunum() {
		return sendunum;
	}
	public void setSendunum(int sendunum) {
		this.sendunum = sendunum;
	}
	public int getReceiveunum() {
		return receiveunum;
	}
	public void setReceiveunum(int receiveunum) {
		this.receiveunum = receiveunum;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	public int getM_state() {
		return m_state;
	}
	public void setM_state(int m_state) {
		this.m_state = m_state;
	}
}
