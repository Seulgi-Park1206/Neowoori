package com.neowoori.app;

public class BAdminPost {
	int postnum;
	String posttype;
	String title;
	String admin_contents;
	String admin_date;
	
	public BAdminPost() {
		//super();
	}
	public BAdminPost(int postnum, String posttype, String title, String admin_contents, String admin_date) {
		//super();
		this.postnum = postnum;
		this.posttype = posttype;
		this.title = title;
		this.admin_contents = admin_contents;
		this.admin_date = admin_date;
	}
	public int getPostnum() {
		return postnum;
	}
	public void setPostnum(int postnum) {
		this.postnum = postnum;
	}
	public String getPosttype() {
		return posttype;
	}
	public void setPosttype(String posttype) {
		this.posttype = posttype;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAdmin_contents() {
		return admin_contents;
	}
	public void setAdmin_contents(String admin_contents) {
		this.admin_contents = admin_contents;
	}
	public String getAdmin_date() {
		return admin_date;
	}
	public void setAdmin_date(String admin_date) {
		this.admin_date = admin_date;
	}
}
