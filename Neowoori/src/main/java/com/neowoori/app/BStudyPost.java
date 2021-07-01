package com.neowoori.app;

public class BStudyPost {
	int postNum;
	int mNum;
	int uNum;
	String postType;
	String  title;
	String post_Contents;
	String post_Date;
	String unick;
	
	public BStudyPost() {

	}
	public BStudyPost(int postNum, int mNum, int uNum, String postType, String title, String post_Contents,
			String post_Date,String unick) {
		//super();
		this.postNum = postNum;
		this.mNum = mNum;
		this.uNum = uNum;
		this.postType = postType;
		this.title = title;
		this.post_Contents = post_Contents;
		this.post_Date = post_Date;
		this.unick = unick;
	}
	
	
	public String getUnick() {
		return unick;
	}
	public void setUnick(String unick) {
		this.unick = unick;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPost_Contents() {
		return post_Contents;
	}
	public void setPost_Contents(String post_Contents) {
		this.post_Contents = post_Contents;
	}
	public String getPost_Date() {
		return post_Date;
	}
	public void setPost_Date(String post_Date) {
		this.post_Date = post_Date;
	}
}
