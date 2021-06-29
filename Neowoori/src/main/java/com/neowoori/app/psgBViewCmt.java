package com.neowoori.app;

public class psgBViewCmt {
	String userid;
	String cmt_date;
	String cmt_contents;
	
	public psgBViewCmt() {
		
	}
	public psgBViewCmt(String userid, String cmt_date, String cmt_contents) {
		this.userid = userid;
		this.cmt_date = cmt_date;
		this.cmt_contents = cmt_contents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(String cmt_date) {
		this.cmt_date = cmt_date;
	}
	public String getCmt_contents() {
		return cmt_contents;
	}
	public void setCmt_contents(String cmt_contents) {
		this.cmt_contents = cmt_contents;
	}

}
