package com.neowoori.app;

public class jsbBListStudy {
	int mNum;
	int uNum;
	String mName;
	String category1;
	String category2;
	String mWhere;
	String mDay;
	String mTime;
	String mPTime;
	String mLevel;
	String mContents;
	String mPersonnel;
	String lati;
	String longi;
	String mWhere2;
	String mWhere3;
	String cnt;
	String adrCounty;
	String adrCity;
	String uNick;
	int state;
	


	jsbBListStudy(){
	}
	
	public jsbBListStudy(int mNum, int uNum, String mName, String category1, String category2, String mWhere,
			String mDay, String mTime, String mPTime, String mLevel, String mContents, String mPersonnel, String lati,
			String longi, String mWhere2, String mWhere3, String cnt, String uNick) {
		//super();
		this.mNum = mNum;
		this.uNum = uNum;
		this.mName = mName;
		this.category1 = category1;
		this.category2 = category2;
		this.mWhere = mWhere;
		this.mDay = mDay;
		this.mTime = mTime;
		this.mPTime = mPTime;
		this.mLevel = mLevel;
		this.mContents = mContents;
		this.mPersonnel = mPersonnel;
		this.lati = lati;
		this.longi = longi;
		this.mWhere2 = mWhere2;
		this.mWhere3 = mWhere3;
		this.cnt = cnt;
		this.uNick = uNick;
		//System.out.println(mWhere.split(" "));
		//String[] tempAddress=mWhere.split(" ");
		//this.adrCounty=tempAddress[0];
		//this.adrCity=tempAddress[1];
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
	public String getmTime() {
		return mTime;
	}
	public void setmTime(String mTime) {
		this.mTime = mTime;
	}
	public String getmPTime() {
		return mPTime;
	}
	public void setmPTime(String mPTime) {
		this.mPTime = mPTime;
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
	public String getLati() {
		return lati;
	}
	public void setLati(String lati) {
		this.lati = lati;
	}
	public String getLongi() {
		return longi;
	}
	public void setLongi(String longi) {
		this.longi = longi;
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
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getAdrCounty() {
		return adrCounty;
	}
	public void setAdrCounty(String adrCounty) {
		this.adrCounty = adrCounty;
	}
	public String getAdrCity() {
		return adrCity;
	}
	public void setAdrCity(String adrCity) {
		this.adrCity = adrCity;
	}
	public String getuNick() {
		return uNick;
	}
	public void setuNick(String uNick) {
		this.uNick = uNick;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
