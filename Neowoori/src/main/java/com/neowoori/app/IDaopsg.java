package com.neowoori.app;

import java.util.ArrayList;

public interface IDaopsg {
	// DB 데이터 이용 관련 함수 작성
//	public ArrayList<BDto> psgListDao();
	public BMembers psgUserInfo(String uid);	// mypage_userInfo
	public void psgUpdateUserInfo(String id, String pw, String nick, String mobile, String email);
	public int psgNickCheck(String nick);
	public ArrayList<BStudy> psgStudyInfo(String uid);	// meetList_studyList select
	
}
