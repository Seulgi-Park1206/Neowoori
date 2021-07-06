package com.neowoori.app;

import java.util.ArrayList;

public interface IDaojsb {
	public ArrayList<BStudy> jsbSelectlocation();
	public ArrayList<BStudy> jsbGetStudyInfo();
	public void jsbCreateStudy(int mUserNum,String mName,String CATEGORY1,String CATEGORY2,String mWhere,String mDay,String mTime,String mPtime,String mLevel,String mContents,String mPersonnel,String lati,String longi,String mWhere2,String mWhere3);
	public BMembers jsbGetUser(String loginUId);
	public BMembers jsbGetUserNick(String nick);
	public int jsbFindStudyMnum(int unum,String mName);
	public void jsbCreateMeet(int UNum, int MNum, int state);
	public int jsbFindStudyName(String mName);
	public int jsbFindStudySignon(int mNum,int uNum);
	public int jsbFindUserStateMeeting(int mNum,int uNum);
	public void jsbJoinStudy(int uNum, int mNum);
	public void jsbCancelJoin(int uNum, int mNum);
	public void jsbJoinOut(int uNum, int mNum);
	public void jsbSendModalMsg(int sendNum, int recNum,String cont);
	public ArrayList<jsbBListStudy> jsbListTypeOne();
	public int jsbListFindMeetState(int mNum,int uNum);
	
	//검색부분
	//제목만
	public ArrayList<jsbBListStudy> jsbListTypeTwo(String word);
	//카테1만
	public ArrayList<jsbBListStudy> jsbListTypethr(String cate1);
	//카테1,2만
	public ArrayList<jsbBListStudy> jsbListTypefor(String cate1, String cate2);
	//모두 입력
	public ArrayList<jsbBListStudy> jsbListTypefiv(String cate1, String cate2, String word);
	
}