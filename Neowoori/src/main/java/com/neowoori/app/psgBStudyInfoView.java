package com.neowoori.app;

public class psgBStudyInfoView {
	String uNick;
	int cMcount;	// 현재 가입 인원
	int mNum;
	int uNum;
	String mName;
	String category1;
	String category2;
	String mWhere;
	String mDay;
	String mContents;
	String mPersonnel; // 최대 인원
	String mTime;	// 시작 시간
	String mPtime;	// 진행 시간
	String mLevel;	// 난이도
	String Lati;	// 위도
	String Longi;	// 경도
	String mWhere2;
	String mWhere3;
	
	public psgBStudyInfoView() {
		
	}
	public psgBStudyInfoView(String uNick, int cMcount, int mNum, int uNum, String mName, String category1,
			String category2, String mWhere, String mDay, String mContents, String mPersonnel, String mTime,
			String mPtime, String mLevel, String lati, String longi, String mWhere2, String mWhere3) {
		this.uNick = uNick;
		this.cMcount = cMcount;
		this.mNum = mNum;
		this.uNum = uNum;
		this.mName = mName;
		this.category1 = category1;
		this.category2 = category2;
		this.mWhere = mWhere;
		this.mDay = mDay;
		this.mContents = mContents;
		this.mPersonnel = mPersonnel;
		this.mTime = mTime;
		this.mPtime = mPtime;
		this.mLevel = mLevel;
		Lati = lati;
		Longi = longi;
		this.mWhere2 = mWhere2;
		this.mWhere3 = mWhere3;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public int getcMcount() {
		return cMcount;
	}
	public void setcMcount(int cMcount) {
		this.cMcount = cMcount;
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
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getmWhere() {
		return mWhere;
	}
	public void setmWhere(String mWhere) {
		this.mWhere = mWhere;
	}
	public String getmDay() {
		return mDay;
	}
	public void setmDay(String mDay) {
		this.mDay = mDay;
	}
	public String getmContents() {
		return mContents;
	}
	public void setmContents(String mContents) {
		this.mContents = mContents;
	}
	public String getmPersonnel() {
		return mPersonnel;
	}
	public void setmPersonnel(String mPersonnel) {
		this.mPersonnel = mPersonnel;
	}
	public String getmTime() {
		return mTime;
	}
	public void setmTime(String mTime) {
		this.mTime = mTime;
	}
	public String getmPtime() {
		return mPtime;
	}
	public void setmPtime(String mPtime) {
		this.mPtime = mPtime;
	}
	public String getmLevel() {
		return mLevel;
	}
	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
	}
	public String getLati() {
		return Lati;
	}
	public void setLati(String lati) {
		Lati = lati;
	}
	public String getLongi() {
		return Longi;
	}
	public void setLongi(String longi) {
		Longi = longi;
	}
	public String getmWhere2() {
		return mWhere2;
	}
	public void setmWhere2(String mWhere2) {
		this.mWhere2 = mWhere2;
	}
	public String getmWhere3() {
		return mWhere3;
	}
	public void setmWhere3(String mWhere3) {
		this.mWhere3 = mWhere3;
	}
}
