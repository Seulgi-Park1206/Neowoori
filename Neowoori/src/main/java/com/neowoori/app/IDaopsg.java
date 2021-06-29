package com.neowoori.app;

import java.util.ArrayList;

public interface IDaopsg {
	// DB 데이터 이용 관련 함수 작성
//	public ArrayList<BDto> psgListDao();
	public BMembers psgUserInfo(String uid);	// Select mypage_userInfo
	public void psgUpdateInfo(String id, String field, String value);	// Update mypage
	public int psgDupCheck(String id, String field, String value);	// Check Dup
	public psgBViewPost psgSelectStudyPost(int pNum);	// Select Study Post
	public ArrayList<BStudy> psgStudyInfo(String uid);	// Select meetList_studyList
	
}
