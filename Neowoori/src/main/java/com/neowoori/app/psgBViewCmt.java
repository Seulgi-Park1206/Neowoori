package com.neowoori.app;

public class psgBViewCmt {
	int cmtnum;
	String unick;
	String cmt_date;
	String cmt_contents;
	
	public psgBViewCmt() {
		
	}
	public psgBViewCmt(int cmtnum, String unick, String cmt_date, String cmt_contents) {
		this.cmtnum = cmtnum;
		this.unick = unick;
		this.cmt_date = cmt_date;
		this.cmt_contents = cmt_contents;
	}
	public int getCmtnum() {
		return cmtnum;
	}
	public void setCmtnum(int cmtnum) {
		this.cmtnum = cmtnum;
	}
	public String getUnick() {
		return unick;
	}
	public void setUnick(String unick) {
		this.unick = unick;
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
