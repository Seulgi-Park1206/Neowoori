package com.neowoori.app;

public class psgBViewCmt {
	int cmtnum;
	String userid;
	String cmt_date;
	String cmt_contents;
	
	public psgBViewCmt() {
		
	}
	public psgBViewCmt(int cmtnum, String userid, String cmt_date, String cmt_contents) {
		this.cmtnum = cmtnum;
		this.userid = userid;
		this.cmt_date = cmt_date;
		this.cmt_contents = cmt_contents;
	}
	public int getCmtnum() {
		return cmtnum;
	}
	public void setCmtnum(int cmtnum) {
		this.cmtnum = cmtnum;
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
