package com.neowoori.app;

import java.util.ArrayList;

public interface IDaojsb {
	public ArrayList<BStudy> jsbSelectlocation();
	public ArrayList<BStudy> jsbGetTest();
	public void jsbCreateStudy(int mUserNum,String mName,String CATEGORY1,String CATEGORY2,String mWhere,String mDay,String mTime,String mPtime,String mLevel,String mContents,String mPersonnel,String lati,String longi);
	public BMembers jsbGetUser(String loginUId);
}
