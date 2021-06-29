package com.neowoori.app;

public class psgBViewPost {
	String title;
	String userid;
	String post_date;
	String post_contents;
	
	public psgBViewPost() {
		
	}

	public psgBViewPost(String title, String userid, String post_date, String post_contents) {
		super();
		this.title = title;
		this.userid = userid;
		this.post_date = post_date;
		this.post_contents = post_contents;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}

	public String getPost_contents() {
		return post_contents;
	}

	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}
	
}
