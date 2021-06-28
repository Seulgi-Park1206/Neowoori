package com.neowoori.app;

import java.util.ArrayList;

public interface IDaojsb {
	public ArrayList<BStudy> jsbSelectlocation();
	public ArrayList<BStudy> jsbGetTest();
	public void jsbCreateStudy(int mUserNum,String mName,String CATEGORY1,String CATEGORY2,String mWhere,String mDay,String mTime,String mPtime,String mLevel,String mContents,String mPersonnel,String lati,String longi,String mWhere2,String mWhere3);
	public BMembers jsbGetUser(String loginUId);
	public int jsbFindStudyMnum(int unum,String mName);
	public void jsbCreateMeet(int UNum, int MNum, int state);
	public int jsbFindStudyName(String mName);
	
}
