package com.neowoori.app;

public class BStudy {
	int mNum;
	int uNum;
	String mName;
	String category1;
	String category2;
	String mWhere;
	String mDay;
	String mContents;
	String mPersonnel;
	String mTime;
	int mPtime;
	String mLevel;
	String Lati;
	String Longi;
	
	public BStudy() {
		//기본생성자
	}
	
	public BStudy(int mNum, int uNum, String mName, String category1, String category2, String mWhere, String mDay,
			String mContents, String mPersonnel, String mTime, int mPtime, String mLevel, String lati, String longi) {
		//super();
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
		this.Lati = lati;
		this.Longi = longi;
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

	public void setmTime(String mTime) {
		this.mTime = mTime;
	}

	public String getmTime() {
		return mTime;
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
	public int getmPtime() {
		return mPtime;
	}
	public void setmPtime(int mPtime) {
		this.mPtime = mPtime;
	}
	public String getmLevel() {
		return mLevel;
	}
	public void setmLevel(String mLevel) {
		this.mLevel = mLevel;
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
	
}
